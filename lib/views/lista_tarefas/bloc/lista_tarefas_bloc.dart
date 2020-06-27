
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newcursoflutter/modules/lista_tarefas/repositories/FileRepository.dart';
import 'package:newcursoflutter/views/lista_tarefas/bloc/lista_tarefa_event.dart';
import 'package:newcursoflutter/views/lista_tarefas/bloc/lista_tarefa_state.dart';
import 'package:newcursoflutter/views/shared/states/defaultState.dart';

class ListaTarefaBloc extends Bloc<ListaTarefaEvent, DefaultState> {

  final _listaTarefaRepository = FileRepository();
  var _list = List<Map<String, dynamic>>();
  Map<String, dynamic> _lastItemRemoved;
  
  @override
  DefaultState get initialState => Initial();

  @override
  Stream<DefaultState> mapEventToState(ListaTarefaEvent event) async* {
    
    switch (event.runtimeType) {

      case GetData:
       
        var _data = await _listaTarefaRepository.readFile();
        if(_data.isNotEmpty){
          var _dataMap = jsonDecode(_data);
          _list = List<Map<String,dynamic>>.from(_dataMap);
        }
        yield GetDataLoaded(list: _list);
        
        break;
        
      case SaveData:
       yield Loading();
       var e = event as SaveData;
       try{
        _list.add(e.item); 
        await _listaTarefaRepository.saveFile(_list);
        yield GetDataLoaded(list: _list); 
       }catch(e){}
       break;

      case ChangeStatus:
       yield Loading();
       var e = event as ChangeStatus;
       _list[e.indexItem]['ok'] = e.status;
       await _listaTarefaRepository.saveFile(_list);
       yield GetDataLoaded(list: _list);
       break;
       
       case RemoveOrUndoItem:
        yield Loading();
        var e = event as RemoveOrUndoItem;

        if(e.action.contains('remove')){
          _lastItemRemoved = _list[e.indexItem];
          _list.removeAt(e.indexItem);
        }else{
          _list.insert(e.indexItem, _lastItemRemoved);
        }
        await _listaTarefaRepository.saveFile(_list);
        yield GetDataLoaded(list: _list);
        break;
      
    }

  }

 
}