import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newcursoflutter/views/conversor/bloc/conversor_bloc.dart';
import 'package:newcursoflutter/views/conversor/bloc/conversor_event.dart';
import 'package:newcursoflutter/views/conversor/pages/conversorModule.dart';

class Conversor extends StatefulWidget {
  @override
  _ConversorState createState() => _ConversorState();
}

class _ConversorState extends State<Conversor> {

  final _conversorBloc = ConversorBloc();

  @override
  void dispose() {
    super.dispose();
    _conversorBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text(
          '\$ Conversor \$',
          style: TextStyle(
            color: Colors.amber
          ),
        ),
      ),
      body: BlocProvider<ConversorBloc>(
        create: (context) => _conversorBloc..add(GetIbovespaData()),
        child: ConversorModule(),
      ),
    );
  }

}