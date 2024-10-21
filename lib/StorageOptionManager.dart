import 'package:flutter/cupertino.dart';
// import 'dropboxWrapperExample.dart';
import 'dropboxWrapper.dart';

enum StorageOption {
  // TODO: Implement Google and Local Only
  dropbox(label: 'Dropbox', view: DropboxWrapper()),
  googleDrive(label: 'Google Drive', view: Placeholder()),
  localOnly(label: 'Local Only', view: Placeholder());

  const StorageOption({
    required this.label,
    required this.view,
  });

  final String label;
  final Widget view;
}

class StorageOptionManager extends StatelessWidget {
  const StorageOptionManager({super.key});

  @override
  Widget build(BuildContext context) {
    StorageOption storageOption = StorageOption.dropbox;

    return (storageOption.view);
  }
}
