import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  title: 'Contador de Pessoas',
  home: Home()
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

 int _people = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
    children: <Widget>[
      Image.asset(
        "images/restaurant.jpg",
        fit: BoxFit.cover,
        height: 1000.0,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Pessoas $_people',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  child: Text(
                    '+1',
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.white
                    ),
                  ),
                  onPressed: (){

                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  child: Text(
                    '-1',
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.white
                    ),
                  ),
                  onPressed: (){
                    print('-1');
                  },
                ),
              ),
            ],
          ),
           Text(
            'Pode Entrar !',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30.0
            ),
          ),
        ],
      ),
    ],
  );
  }
}