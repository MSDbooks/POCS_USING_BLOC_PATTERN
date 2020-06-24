import 'package:flutter/material.dart';

class ConversorBody extends StatefulWidget {

  final Map<String, dynamic> data;
  const ConversorBody({Key key, @required this.data}) : super(key: key);

  @override
  _ConversorBodyState createState() => _ConversorBodyState();
}

class _ConversorBodyState extends State<ConversorBody> {

  double _dolar;
  double _euro;
  double _real;

  final _realController = TextEditingController();
  final _dolarController = TextEditingController();
  final _euroController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dolar = widget.data['results']['currencies']['USD']['buy'];
    _euro = widget.data['results']['currencies']['EUR']['buy'];

    _realController.addListener(() {

       if(_realController.text.isNotEmpty){
        _real = double.parse(_realController.text);
        _dolarController.text = (_real/_dolar).toStringAsFixed(2);
        _euroController.text = (_real/_euro).toStringAsFixed(2);
       }else {
         _dolarController.text = '';
         _euroController.text = '';
       }
     

     });

  }

  @override
  void dispose() {
    super.dispose();
    _realController.dispose();
    _dolarController.dispose();
    _euroController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.monetization_on, size: 150.0, color: Colors.amber),
            _textField('Reais', 'R\$ ', _realController),
            _textField('Dolares', 'US\$ ', _dolarController),
            _textField('Euros', '€\$ ', _euroController),
          ],
        ),
      ),
    );
  }

  Widget _textField(String label, String prefix, TextEditingController _controller) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.amber),
          border: OutlineInputBorder(),
          enabledBorder:OutlineInputBorder(
            borderSide:BorderSide(color: Colors.amber, width: 2.0),
            borderRadius: BorderRadius.circular(7.0),
          ),
          prefixText: prefix 
        ),
        style: TextStyle(
          color: Colors.amber
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}