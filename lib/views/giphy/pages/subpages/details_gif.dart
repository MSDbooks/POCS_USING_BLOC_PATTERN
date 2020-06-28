import 'package:flutter/material.dart';
import 'package:share/share.dart';

class DetailsGif extends StatelessWidget {
  final Map<String, dynamic> _gif;

  DetailsGif(this._gif);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ), 
          onPressed: (){
            Navigator.pop(context);
          }
        ),
        title: Text(
                _gif['title'],
                style: TextStyle(
                  color: Colors.white
                ),
              ),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share, color: Colors.white), 
            onPressed: (){
              Share.share(_gif['images']['fixed_height']['url']);
            }
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Image.network(_gif['images']['fixed_height']['url'])
      ),
    );
  }
}