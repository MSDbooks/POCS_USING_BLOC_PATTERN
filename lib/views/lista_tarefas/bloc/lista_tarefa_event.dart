import 'package:flutter/material.dart';

class ListaTarefaEvent  {}

class GetData extends ListaTarefaEvent {

  @override
  String toString() => 'GetData';
}

class SaveData extends ListaTarefaEvent {

  final Map<String,dynamic> item;
  SaveData({@required this.item});

  @override
  String toString() => 'SaveData';
}

class ChangeStatus extends ListaTarefaEvent {

  final int indexItem;
  final bool status;
  ChangeStatus({@required this.indexItem, @required this.status});

  @override
  String toString() => 'ChangeStatus';
}

class RemoveOrUndoItem extends ListaTarefaEvent {

  final int indexItem;
  final String action;
  RemoveOrUndoItem({@required this.indexItem, @required this.action});

  @override
  String toString() => 'RemoveItem';
}

