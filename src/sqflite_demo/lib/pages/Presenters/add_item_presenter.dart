import 'dart:async';

import 'package:sqflite_demo/data/sqflite_helper.dart';
import 'package:sqflite_demo/models/item.dart';

abstract class AddItemPageContract{
  void onSuccess(Item ele);
}

class AddItemPagePresenter{
  AddItemPageContract _view;
  DatabaseHelper databaseHelper = new DatabaseHelper();
  AddItemPagePresenter(this._view);

  addItem(String text){
    var completer = new Completer();
    Item ele = new Item(text);
    databaseHelper.saveItem(ele)
    .then((x)=> _view.onSuccess(ele))
    .catchError((e) => completer.completeError(""));
    return completer.future;
  }

}