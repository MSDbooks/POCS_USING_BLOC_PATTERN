import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newcursoflutter/modules/conversor/repositories/conversorRepository.dart';
import 'package:newcursoflutter/views/conversor/bloc/conversor_event.dart';
import 'package:newcursoflutter/views/conversor/bloc/conversor_state.dart';
import 'package:newcursoflutter/views/shared/states/defaultState.dart';

class ConversorBloc extends Bloc<ConversorEvent, DefaultState> {

  final _conversorRepository = ConversorRepository();
  
  @override
  DefaultState get initialState => Initial();
  

  @override
  Stream<DefaultState> mapEventToState(ConversorEvent event) async* {
    
    switch (event.runtimeType) {

      case GetIbovespaData:
        yield Loading();
        var _result = await _conversorRepository.getIbovespaData();

        if(_result.isNotEmpty) {
          yield GetIbovespaDataLoaded(data: _result);
        } else {
          yield Error(error: 'Falha na requisição');
        }

        break;


    }
    
  }


}