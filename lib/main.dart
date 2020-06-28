import 'package:flutter/material.dart';
import 'package:newcursoflutter/views/conversor/pages/conversor.dart';
import 'package:newcursoflutter/views/giphy/pages/giphy_home.dart';
import 'package:newcursoflutter/views/lista_tarefas/pages/lista_tafera_home.dart';

void main() => runApp(MaterialApp(
  title: 'Contador de Pessoas',
  home: GiphyHome(),
  debugShowCheckedModeBanner: false,
  //home: ListaTarefaHome(),
  //home: Conversor(),
  theme: ThemeData(
    hintColor: Colors.white,
    primaryColor: Colors.white
  ),
));
