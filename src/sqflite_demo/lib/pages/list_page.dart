import 'package:flutter/material.dart';
import 'package:sqflite_demo/data/sqflite_helper.dart';
import 'package:sqflite_demo/models/item.dart';
import 'package:sqflite_demo/pages/Presenters/list_page_presenter.dart';
import 'package:sqflite_demo/pages/add_item_page.dart';

final scaffoldKey = new GlobalKey<ScaffoldState>();

class ListPage extends StatelessWidget {
  @override
  build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: new Text(
          "To-Do List",
          textScaleFactor: 2.0,
        ),
        backgroundColor: Colors.brown,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add),
            onPressed: () => addItem(context),
          )
        ],
      ),
      body: new ItemList(),
    );
  }

  void addItem(BuildContext context) {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new AddItemPage();
    }));
  }
}

class ItemList extends StatefulWidget {
  @override
  _ItemListState createState() => new _ItemListState();
}

class _ItemListState extends State<ItemList> implements ItemListContract {
  DatabaseHelper databaseHelper = new DatabaseHelper();
  List<Item> listOfItems = new List<Item>();
  ListPagePresenter listPagePresenter;

  _ItemListState() {
    listPagePresenter = new ListPagePresenter(this);
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(text),
      backgroundColor: Colors.black,
    ));
  }

  @override
  void onItemDeletedSuccess(Item item) {
    _showSnackBar("Item with id " + item.id + " deleted");
  }

  @override
  void onRefreshList(List<Item> lst) {
    // this list has been updated, must refresh
    this.listOfItems = lst;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listPagePresenter.doListRefresh();
    this.listOfItems = new List<Item>();
    print("List of items initialized");
  }

  @override
  Widget build(BuildContext context) {
    listPagePresenter.doListRefresh();
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {


        if (this.listOfItems == null) {
          print("List of Items null");
        } else {
          print("List of items not null");
        }

        if (i < this.listOfItems.length) {
          return _buildRow(listOfItems[i]);
        }
      },
    );
  }

  Widget _buildRow(Item item) {
    return new Container(
      color: Colors.black,
      margin: const EdgeInsets.only(bottom: 10.0),
      child:  new ListTile(
      title: new Container(
          child: new Text(
            item.elementText,
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Colors.white),
          ),
          margin: const EdgeInsets.only(bottom: 10.0),
          
          ),
      trailing: new IconButton(
          icon: new Icon(Icons.remove_circle, color: Colors.red, ),
          onPressed: () => listPagePresenter.deleteItem(item),
        ),
    ));
    
  }
}
