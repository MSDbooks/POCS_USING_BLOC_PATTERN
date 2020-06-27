

import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileRepository{

  Future<File> getFile() async {
    final _directory = await getApplicationDocumentsDirectory();
    return File('${_directory.path}data.json');
  }

  Future<File> saveFile(List<Map<String, dynamic>> _toDoList) async {
    String _data = json.encode(_toDoList);

    final _file = await getFile();
    return _file.writeAsString(_data);

  }

  Future<String> readFile() async {

    try{
      final _file = await getFile();
      return _file.readAsString();
    }catch(e){
      return null;
    }

  }

}