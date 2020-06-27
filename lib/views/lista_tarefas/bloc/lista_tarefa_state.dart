import 'package:meta/meta.dart';
import 'package:newcursoflutter/views/shared/states/defaultState.dart';

class GetDataLoaded extends DefaultState {

  final List<Map<String, dynamic>> list;

  GetDataLoaded({@required this.list}) : super();

  @override
  String toString() => 'GetDataLoaded';
}