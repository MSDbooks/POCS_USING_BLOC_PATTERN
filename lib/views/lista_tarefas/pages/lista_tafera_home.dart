import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newcursoflutter/views/lista_tarefas/bloc/lista_tarefa_event.dart';
import 'package:newcursoflutter/views/lista_tarefas/bloc/lista_tarefas_bloc.dart';
import 'package:newcursoflutter/views/lista_tarefas/pages/lista_tarefa_module.dart';

class ListaTarefaHome extends StatefulWidget {
  @override
  _ListaTarefaHomeState createState() => _ListaTarefaHomeState();
}

class _ListaTarefaHomeState extends State<ListaTarefaHome> {

  final _bloc = ListaTarefaBloc();

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de tarefas'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => _bloc..add(GetData()),
        child: ListaTarefaModule(),
      ),
    );
  }
}