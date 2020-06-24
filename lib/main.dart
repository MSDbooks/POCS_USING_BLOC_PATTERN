import 'package:flutter/material.dart';
import 'package:newcursoflutter/views/conversor/pages/conversor.dart';

void main() => runApp(MaterialApp(
  title: 'Contador de Pessoas',
  home: Conversor(),
  theme: ThemeData(
    hintColor: Colors.amber,
    primaryColor: Colors.white
  ),
));
