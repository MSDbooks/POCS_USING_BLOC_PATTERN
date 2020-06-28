import 'package:flutter/material.dart';
import 'package:newcursoflutter/views/giphy/bloc/giphy_bloc.dart';
import 'package:newcursoflutter/views/giphy/bloc/giphy_event.dart';
import 'package:newcursoflutter/views/giphy/pages/subpages/details_gif.dart';

class SearchGifs extends StatefulWidget {
  final Map<String, dynamic> listGifs;
  final GiphyBloc bloc;

  const SearchGifs({Key key, @required this.listGifs, @required this.bloc}) : super(key: key);
  @override
  _SearchGifsState createState() => _SearchGifsState();
}

class _SearchGifsState extends State<SearchGifs> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: TextField(
            onSubmitted:(text) {
              if(text.length >= 3 ){
                widget.bloc..add(GetGifs(searchWord: text));
              }
            },
            decoration: InputDecoration(
              labelText: 'Pesquise aqui',
              labelStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder(),
              enabledBorder:OutlineInputBorder(
                borderSide:BorderSide(color: Colors.amber, width: 2.0),
                borderRadius: BorderRadius.circular(7.0),
              ),
            ),
            style: TextStyle(color: Colors.white, fontSize: 15.0),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: _createGifTable(context)
        ),
      ],
    );
  }

  Widget _createGifTable(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0
      ), 
      itemCount: widget.listGifs['data'].length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Image.network(
                    widget.listGifs['data'][index]['images']['fixed_height']['url'],
                    height: 300.0,
                    fit: BoxFit.cover,
                 ),
          onTap:(){
            Navigator.push(context, 
              MaterialPageRoute(builder: (context) => DetailsGif(widget.listGifs['data'][index])),
            );
          },        
        );
      }
    );
  }
}