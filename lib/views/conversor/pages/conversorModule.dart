import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newcursoflutter/views/conversor/bloc/conversor_bloc.dart';
import 'package:newcursoflutter/views/conversor/bloc/conversor_state.dart';
import 'package:newcursoflutter/views/conversor/pages/subPages/conversor_body.dart';
import 'package:newcursoflutter/views/shared/states/defaultState.dart';

class ConversorModule extends StatefulWidget {
  @override
  _ConversorModuleState createState() => _ConversorModuleState();
}

class _ConversorModuleState extends State<ConversorModule> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SafeArea(
        top: false,
            bottom: false,
            child: Container (
              child: BlocBuilder<ConversorBloc, DefaultState>(
                bloc: BlocProvider.of<ConversorBloc>(context),
                builder: (BuildContext context, DefaultState state) {

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
                  
                  if (state is GetIbovespaDataLoaded) {
                     return Center(
                      child: ConversorBody(data: state.data),
                    );
                  }

                  return Container();
                },
              ),
            ),
      ),
      
    );
  }
}