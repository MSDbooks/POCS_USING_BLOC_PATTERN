import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newcursoflutter/views/lista_tarefas/bloc/lista_tarefa_state.dart';
import 'package:newcursoflutter/views/lista_tarefas/bloc/lista_tarefas_bloc.dart';
import 'package:newcursoflutter/views/lista_tarefas/pages/subPages/lista_tarefa_body.dart';
import 'package:newcursoflutter/views/shared/states/defaultState.dart';

class ListaTarefaModule extends StatefulWidget {
  @override
  _ListaTarefaModuleState createState() => _ListaTarefaModuleState();
}

class _ListaTarefaModuleState extends State<ListaTarefaModule> {

  ListaTarefaBloc _bloc;
  @override
  void initState() {
    super.initState();

    if(_bloc == null){
      _bloc = BlocProvider.of<ListaTarefaBloc>(context);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SafeArea(
        top: false,
        bottom: false,
        child: Container(
          child: BlocBuilder<ListaTarefaBloc, DefaultState>(
            bloc: BlocProvider.of<ListaTarefaBloc>(context),
            builder: (context, state){

              if (state is Initial) {
                 return Center(
                  child: CircularProgressIndicator(),
                );
              }
              
              if (state is Loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if(state is GetDataLoaded){
                return ListaTarefaBody(list: state.list, bloc: _bloc);
              }

              return Container();
            },
          ) ,
        ),
      ),
    );
  }
}