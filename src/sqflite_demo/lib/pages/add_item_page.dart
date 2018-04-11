import 'package:flutter/material.dart';
import 'package:sqflite_demo/models/item.dart';
import 'package:sqflite_demo/pages/Presenters/add_item_presenter.dart';

class AddItemPage extends StatefulWidget {
  @override
  _AddItemPageState createState() => new _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage>
    implements AddItemPageContract {
  AddItemPagePresenter presenter;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  var enteredText = "";

  _AddItemPageState(){
    presenter = new AddItemPagePresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        backgroundColor: Colors.brown,
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.all(20.0),
            padding: const EdgeInsets.all(20.0),
            child: new Column(
              children: <Widget>[
                new Container(
                  margin: const EdgeInsets.only(bottom: 20.0),
                  child: new Form(
                    key: formKey,
                    child: new TextFormField(
                      onSaved: (val) => enteredText = val,
                      decoration: new InputDecoration(labelText: "To-Do Item"),
                    ),
                  ),
                ),
                new MaterialButton(
                    color: Colors.black,
                    child: new Text(
                      "Add Item",
                      style: new TextStyle(fontSize: 24.0, color: Colors.white),
                    ),
                    onPressed: () => onAddItem()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  onAddItem() {
    final form = formKey.currentState;
    form.save();
    presenter.addItem(enteredText);
  }

  @override
  void onSuccess(Item ele) {
    _showSnackBar("Item with the id " + ele.id + " added successfully!");
    // TODO: implement onSuccess
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(text),
      backgroundColor: Colors.black,
    ));
  }
}
