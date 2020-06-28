import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newcursoflutter/modules/giphy/repositories/giphyRepository.dart';
import 'package:newcursoflutter/views/giphy/bloc/giphy_event.dart';
import 'package:newcursoflutter/views/giphy/bloc/giphy_state.dart';
import 'package:newcursoflutter/views/shared/states/defaultState.dart';

class GiphyBloc extends Bloc<GiphyEvent, DefaultState> {

  final _giphyRepository = GiphyRepository();
  
  @override
  DefaultState get initialState => Initial();
  

  @override
  Stream<DefaultState> mapEventToState(GiphyEvent event) async* {
    
    switch (event.runtimeType) {

      case GetGifs:
       yield Loading();
       var e = event as GetGifs;
       var _result = await _giphyRepository.getGifs(e.searchWord); 

       if(_result.isNotEmpty){
         yield GetGifsLoaded(listGifs: _result);
       }
       break;


    }
    
  }


}