import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newcursoflutter/views/giphy/bloc/giphy_bloc.dart';
import 'package:newcursoflutter/views/giphy/bloc/giphy_state.dart';
import 'package:newcursoflutter/views/giphy/pages/subpages/search_gifs.dart';
import 'package:newcursoflutter/views/shared/states/defaultState.dart';

class GiphyModule extends StatefulWidget {
  @override
  _GiphyModuleState createState() => _GiphyModuleState();
}

class _GiphyModuleState extends State<GiphyModule> {
  
  GiphyBloc _bloc;

  @override
  void initState() {
    super.initState();

    if(_bloc == null){
      _bloc = BlocProvider.of<GiphyBloc>(context);
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
        child: BlocBuilder<GiphyBloc, DefaultState>(
          bloc: BlocProvider.of<GiphyBloc>(context),
          builder: (context, state) {

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
              if(state is GetGifsLoaded){
                return SearchGifs(listGifs: state.listGifs, bloc: _bloc);
              }
              return Container();

          }
        ),
      ),
      
    );
  }
}