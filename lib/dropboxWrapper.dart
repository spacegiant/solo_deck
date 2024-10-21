import 'package:dropbox_client/dropbox_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DropboxWrapper extends StatefulWidget {
  const DropboxWrapper({super.key});

  @override
  State<DropboxWrapper> createState() => _DropboxWrapperState();
}

class _DropboxWrapperState extends State<DropboxWrapper> {
  String? accessToken;
  String? credentials;
  late Future<dynamic> listData;

  @override
  void initState() {
    super.initState();
    initDropbox();
    listFolder('');
  }

  Future initDropbox() async {
    String dropboxClientId = dotenv.env['DROPBOX_APP_ID'] ?? '';
    String dropboxKey = dotenv.env['DROPBOX_APP_KEY'] ?? '';
    String dropboxSecret = dotenv.env['DROPBOX_APP_SECRET'] ?? '';

    await Dropbox.init(dropboxClientId, dropboxKey, dropboxSecret);

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

  // Future authorizePKCE() async {
  //   await Dropbox.authorizePKCE();
  // }

  // Future unlinkCredentials() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.remove('dropboxCredentials');
  //
  //   setState(() {
  //     credentials = null;
  //   });
  //   await Dropbox.unlink();
  // }

  // Future authorizeWithCredentials() async {
  //   if (credentials != null) {
  //     await Dropbox.authorizeWithCredentials(credentials!);
  //   }
  // }

  Future listFolder(path) async {
    if (await checkAuthorized(true)) {
      final result = await Dropbox.listFolder(path);
      print(result);
      setState(() {
        list.clear();
        list.addAll(result);
      });
    }
  }

  final list = List<dynamic>.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('hello'),
            CupertinoButton(
                child: Text('Refresh'), onPressed: () => listFolder(''))
          ],
        ),
      ),
    );
  }
}
