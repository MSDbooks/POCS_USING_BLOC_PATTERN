import 'package:flutter/material.dart';
import 'package:newcursoflutter/views/lista_tarefas/bloc/lista_tarefa_event.dart';
import 'package:newcursoflutter/views/lista_tarefas/bloc/lista_tarefas_bloc.dart';

class ListaTarefaBody extends StatefulWidget {
  final List<Map<String, dynamic>> list;
  final ListaTarefaBloc bloc;
  const ListaTarefaBody({Key key, @required this.list, @required this.bloc}) : super(key: key);
  @override
  _ListaTarefaBodyState createState() => _ListaTarefaBodyState();
}

class _ListaTarefaBodyState extends State<ListaTarefaBody> {

  List<Map<String, dynamic>> _list;
  ListaTarefaBloc _bloc;
  var _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _list = widget.list ?? List();
    _bloc = widget.bloc;
  }

  void _addTask(){
    Map<String, dynamic> _map = Map();
    _map['title'] = _textEditingController.text;
    _map['ok'] = false;
    
    _bloc..add(SaveData(item: _map));
    _textEditingController.text = "";
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(17.0, 10, 7.0, 1.0),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                      labelText: 'Nova Tarefa',
                      labelStyle: TextStyle(
                        color: Colors.blueAccent
                      )
                    ),
                    controller: _textEditingController,
                  ),
                ),
                RaisedButton(
                  color: Colors.blueAccent,
                  child: Text('ADD'),
                  textColor: Colors.white,
                  onPressed: _addTask,
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10.0),
              itemCount: _list.length,
              itemBuilder: _itemBuilder
            ),
          ),
        ],
    );
  }

  Widget _itemBuilder(context, index) {
    return Dismissible(
      key: Key(index.toString()),
      background: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment(-0.9, 0.0),
          child: Icon(Icons.delete, color: Colors.white),
        ),
      ),
      direction: DismissDirection.startToEnd,
      child: CheckboxListTile(
        title: Text(_list[index]["title"]),
        value: _list[index]["ok"],
        secondary: CircleAvatar(
          child: Icon(_list[index]['ok'] ? Icons.check : Icons.error)
        ),
        onChanged:(checked){
          _bloc..add(ChangeStatus(indexItem: index, status: checked));
        },
      ),
      onDismissed: (direction){
        _bloc..add(RemoveOrUndoItem(indexItem: index, action: 'remove'));
        final _snack = SnackBar(
          content: Text('Tarefa: \"${_list[index]['title']}\" removida!'),
          action: SnackBarAction(
            label: "Desfazer", 
            onPressed: (){
              _bloc.add(RemoveOrUndoItem(indexItem: index, action: 'undo'));
            }),
          duration: Duration(seconds: 2),
        );
        Scaffold.of(context).showSnackBar(_snack);
      },
    );
    
    
    
    
  }
}