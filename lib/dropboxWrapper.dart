import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:dropbox_client/dropbox_client.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DropboxWrapper extends StatefulWidget {
  const DropboxWrapper({super.key});

  @override
  State<DropboxWrapper> createState() => _DropboxWrapperState();
}

class _DropboxWrapperState extends State<DropboxWrapper> {
  String? accessToken;
  String? credentials;
  bool showInstruction = false;

  @override
  void initState() {
    super.initState();

    initDropbox();
  }

  Future initDropbox() async {
    String dropboxClientid = dotenv.env['DROPBOX_APP_ID'] ?? '';
    String dropboxKey = dotenv.env['DROPBOX_APP_KEY'] ?? '';
    String dropboxSecret = dotenv.env['DROPBOX_APP_SECRET'] ?? '';

    await Dropbox.init(dropboxClientid, dropboxKey, dropboxSecret);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken = prefs.getString('dropboxAccessToken');
    credentials = prefs.getString('dropboxCredentials');

    setState(() {});
  }

  Future<bool> checkAuthorized(bool authorize) async {
    var credentials = await Dropbox.getCredentials();
    if (credentials != null) {
      if (credentials.isEmpty) {
        credentials = credentials;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('dropboxCredentials', credentials);
      }
      return true;
    }

    final token = await Dropbox.getAccessToken();
    if (token != null) {
      if (accessToken == null || accessToken!.isEmpty) {
        accessToken = token;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('dropboxAccessToken', accessToken!);
      }
      return true;
    }

    if (authorize) {
      if (credentials != null && credentials.isNotEmpty) {
        final credentials = await Dropbox.getCredentials();
        await Dropbox.authorizeWithCredentials(credentials!);
        if (kDebugMode) {
          print('authorizeWithCredentials!');
        }
        return true;
      }
      if (accessToken != null && accessToken!.isNotEmpty) {
        await Dropbox.authorizeWithAccessToken(accessToken!);
        final token = await Dropbox.getAccessToken();
        if (token != null) {
          print('authorizeWithAccessToken!');
          return true;
        }
      } else {
        await Dropbox.authorize();
        print('authorize!');
      }
    }
    return false;
  }

  Future authorize() async {
    await Dropbox.authorize();
  }

  Future authorizePKCE() async {
    await Dropbox.authorizePKCE();
  }

  Future unlinkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('dropboxAccessToken');

    setState(() {
      accessToken = null;
    });
    await Dropbox.unlink();
  }

  Future unlinkCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('dropboxCredentials');

    setState(() {
      credentials = null;
    });
    await Dropbox.unlink();
  }

  Future authorizeWithAccessToken() async {
    await Dropbox.authorizeWithAccessToken(accessToken!);
  }

  Future authorizeWithCredentials() async {
    await Dropbox.authorizeWithCredentials(credentials!);
  }

  Future getAccountName() async {
    if (await checkAuthorized(true)) {
      final user = await Dropbox.getAccountName();
      print('user = $user');
    }
  }

  Future listFolder(path) async {
    if (await checkAuthorized(true)) {
      final result = await Dropbox.listFolder(path);
      setState(() {
        list.clear();
        list.addAll(result);
      });
    }
  }

  Future uploadTest() async {
    if (await checkAuthorized(true)) {
      var tempDir = await getTemporaryDirectory();
      var filepath = '${tempDir.path}/test_upload.txt';
      File(filepath).writeAsStringSync(
          'contents.. from ${Platform.isIOS ? 'iOS' : 'Android'}\n');

      final result =
          await Dropbox.upload(filepath, '/test_upload.txt', (uploaded, total) {
        print('progress $uploaded / $total');
      });
      print(result);
    }
  }

  Future downloadTest() async {
    if (await checkAuthorized(true)) {
      var tempDir = await getTemporaryDirectory();
      var filepath = '${tempDir.path}/test_download.zip'; // for iOS only!!
      print(filepath);

      final result = await Dropbox.download('/file_in_dropbox.zip', filepath,
          (downloaded, total) {
        print('progress $downloaded / $total');
      });

      print(result);
      print(File(filepath).statSync());
    }
  }

  Future<String?> getTemporaryLink(path) async {
    final result = await Dropbox.getTemporaryLink(path);
    return result;
  }

  Uint8List? thumbImage;

  Future getThumbnail(path) async {
    final b64 = await Dropbox.getThumbnailBase64String(path);

    setState(() {
      thumbImage = base64Decode(b64!);
    });
  }

  Future getAccountInfo() async {
    final accountInfo = await Dropbox.getCurrentAccount();

    if (accountInfo != null) {
      print(accountInfo.name!.displayName);
      print(accountInfo.email!);
      print(accountInfo.rootInfo!.homeNamespaceId!);
      print(accountInfo.profilePhotoUrl!);
    }
  }

  final list = List<dynamic>.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dropbox example app'),
      ),
      body: showInstruction
          ? const Instructions()
          : Builder(
              builder: (context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Wrap(
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: authorize,
                          child: const Text('authorize'),
                        ),
                        ElevatedButton(
                          onPressed: accessToken == null
                              ? null
                              : authorizeWithAccessToken,
                          child: const Text('authorizeWithAccessToken'),
                        ),
                        ElevatedButton(
                          onPressed: unlinkToken,
                          child: const Text('unlink'),
                        ),
                      ],
                    ),
                    Wrap(
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: authorizePKCE,
                          child: const Text('authorizePKCE'),
                        ),
                        ElevatedButton(
                          onPressed: credentials == null
                              ? null
                              : authorizeWithCredentials,
                          child: const Text('authorizeWithCredentials'),
                        ),
                        ElevatedButton(
                          onPressed: unlinkCredentials,
                          child: const Text('unlink'),
                        ),
                      ],
                    ),
                    Wrap(
                      children: <Widget>[
                        ElevatedButton(
                          child: const Text('list root folder'),
                          onPressed: () async {
                            await listFolder('');
                          },
                        ),
                        ElevatedButton(
                          child: const Text('test upload'),
                          onPressed: () async {
                            await uploadTest();
                          },
                        ),
                        ElevatedButton(
                          child: const Text('test download'),
                          onPressed: () async {
                            await downloadTest();
                          },
                        ),
                        ElevatedButton(
                          child: const Text('test thumbnail'),
                          onPressed: () async {
                            // await getThumbnail('/icon64.png');
                            await getThumbnail('/Get Started with Dropbox.pdf');
                          },
                        ),
                        if (thumbImage != null) Image.memory(thumbImage!),
                        ElevatedButton(
                          child: const Text('getAccountInfo'),
                          onPressed: () async {
                            await getAccountInfo();
                          },
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          final item = list[index];
                          final filesize = item['filesize'];
                          final path = item['pathLower'];
                          bool isFile = false;
                          var name = item['name'];
                          if (filesize == null) {
                            name += '/';
                          } else {
                            isFile = true;
                          }
                          return ListTile(
                              title: Text(name),
                              onTap: () async {
                                if (isFile) {
                                  final link = await getTemporaryLink(path);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(link ??
                                              'getTemporaryLink error: $path')));
                                } else {
                                  await listFolder(path);
                                }
                              });
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}

class Instructions extends StatelessWidget {
  const Instructions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
              'You need to get dropbox_key & dropbox_secret from https://www.dropbox.com/developers'),
          SizedBox(height: 20),
          Text('1. Update dropbox_key and dropbox_secret from main.dart'),
          SizedBox(height: 20),
          Text(
              "  const String dropbox_key = 'DROPBOXKEY';\n  const String dropbox_secret = 'DROPBOXSECRET';"),
          SizedBox(height: 20),
          Text(
              '2. (Android) Update dropbox_key from android/app/src/main/AndroidManifest.xml.\n  <data android:scheme="db-DROPBOXKEY" />'),
          SizedBox(height: 20),
          Text(
              '2. (iOS) Update dropbox_key from ios/Runner/Info.plist.\n  <string>db-DROPBOXKEY</string>'),
        ],
      ),
    );
  }
}
