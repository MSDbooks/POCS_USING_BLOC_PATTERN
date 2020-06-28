import 'dart:convert';

import 'package:http/http.dart' as http;
class GiphyProvider {

   static final  GiphyProvider  _singletonInstance = GiphyProvider._internal(); 
   static final String _key = 'WtRW0EPkUrBjLgaH0lsQOYX1OMuwvFz6';
   static final String _baseUrl = 'https://api.giphy.com/v1/gifs';
   static final String _endPointTreding  = '/trending?api_key=$_key&limit=$_limit&rating=G';
   static final String _endPointSearch = '/search?api_key=$_key&q=$_searchWord&limit=$_limit&offset=$_offSet&rating=G&lang=en';

   static String _limit;
   static String _searchWord;
   static String _offSet;
   
   factory GiphyProvider() {
     return _singletonInstance;
   }
   GiphyProvider._internal();

   Future<Map<String, dynamic>> getTrendingGifs({String limit = '25' }) async {
     
     _limit = limit;
     var _url = _baseUrl + _endPointTreding;
     final _response = await http.get(_url);

     if(_response.statusCode == 200){
      return json.decode(_response.body);
     } else {
       return null;
     }

   } 


  Future<Map<String, dynamic>> getSearchGifs(String searchWord, {String limit = '25', String offSet = '0' }) async {
     
     _limit = limit;
     _offSet = offSet;
     _searchWord = searchWord;
     var _url = _baseUrl + _endPointSearch;
     final _response = await http.get(_url);

     if(_response.statusCode == 200){
      return json.decode(_response.body);
     } else {
       return null;
     }

   } 
   

}