import 'package:newcursoflutter/modules/giphy/providers/giphyProvider.dart';

class GiphyRepository {

  final _giphyProvider = GiphyProvider();

  Future<Map<String, dynamic>> getGifs(String _searchWord) async {

    if(_searchWord != null) {
      return _giphyProvider.getSearchGifs(_searchWord);
    } else{
      return _giphyProvider.getTrendingGifs();
    }

  }

}