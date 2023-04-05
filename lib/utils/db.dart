import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileStorage {
  final String fileName;
  FileStorage({required this.fileName});

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$fileName');
  }

  Future<File> saveData(String data) async {
    final file = await _localFile;
    return file.writeAsString(data);
  }

  Future<String> getData() async {
    final file = await _localFile;
    return file.readAsString();
  }
}
