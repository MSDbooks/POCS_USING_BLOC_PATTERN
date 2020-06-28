import 'package:meta/meta.dart';
import 'package:newcursoflutter/views/shared/states/defaultState.dart';

class GetGifsLoaded extends DefaultState {

  final Map<String, dynamic> listGifs;
  GetGifsLoaded({@required this.listGifs}) : super();

  @override
  String toString() => 'GetGifsLoaded';
}