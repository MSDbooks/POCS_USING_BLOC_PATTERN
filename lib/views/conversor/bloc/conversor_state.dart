import 'package:meta/meta.dart';
import 'package:newcursoflutter/views/shared/states/defaultState.dart';

class GetIbovespaDataLoaded extends DefaultState {

  final Map<String, dynamic> data;

  GetIbovespaDataLoaded({@required this.data}) : super();

  @override
  String toString() => 'GetIbovespaDataLoaded';
}