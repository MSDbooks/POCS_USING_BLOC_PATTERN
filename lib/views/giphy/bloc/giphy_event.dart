class GiphyEvent  {}

class GetGifs extends GiphyEvent {

  final String searchWord;

  GetGifs({this.searchWord});

  @override
  String toString() => 'GetGifs';
}