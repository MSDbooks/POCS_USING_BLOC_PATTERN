import 'package:flutter/material.dart';

class ConversorBody extends StatefulWidget {

  final Map<String, dynamic> data;

  const ConversorBody({Key key, @required this.data}) : super(key: key);

  @override
  _ConversorBodyState createState() => _ConversorBodyState();
}

class _ConversorBodyState extends State<ConversorBody> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.data['results']['currencies']['USD']['buy'].toString());
  }
}