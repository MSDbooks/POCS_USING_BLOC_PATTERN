import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newcursoflutter/views/giphy/bloc/giphy_bloc.dart';
import 'package:newcursoflutter/views/giphy/bloc/giphy_event.dart';
import 'package:newcursoflutter/views/giphy/pages/giphyModule.dart';

class GiphyHome extends StatefulWidget {
  @override
  _GiphyHomeState createState() => _GiphyHomeState();
}

class _GiphyHomeState extends State<GiphyHome> {
  
  var _bloc = GiphyBloc();

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true, 
        child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.network('https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif'),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.black54,
        body: BlocProvider(
          create: (context) => _bloc..add(GetGifs()),
          child: GiphyModule(),
        ),
      ),
    );
  }
}