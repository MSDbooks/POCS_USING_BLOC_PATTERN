
import 'dart:convert';

import 'package:http/http.dart' as http;

class ConversorProvider {

  static final ConversorProvider _singletonInstance = ConversorProvider._internal();
  static final _baseUrl = 'https://api.hgbrasil.com/finance?format=json&key=3430d189';
  
  factory ConversorProvider() {
    return _singletonInstance;
  }
  ConversorProvider._internal();
  

  Future<Map<String, dynamic>> getIbovespaData() async { 
    
    final _response = await http.get(_baseUrl);

    if(_response.statusCode == 200){
      return json.decode(_response.body);
    } else {
      return null;
    }
    
  }

}