import 'package:sqflite_demo/data/sqflite_helper.dart';
import 'package:sqflite_demo/models/item.dart';

abstract class ItemListContract {
  void onRefreshList(List<Item> lst);
  void onItemDeletedSuccess(Item item);
  List<Item> listOfItems;
}

class ListPagePresenter {
  ItemListContract _view;
  DatabaseHelper databaseHelper = new DatabaseHelper();
  ListPagePresenter(this._view);

  doListRefresh() {
    databaseHelper.getItems().then((list) {
      if (list.length != _view.listOfItems.length) {
        _view.onRefreshList(list);
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

  deleteItem(Item item) {
    databaseHelper.deleteItem(item).then((result) {
      _view.onItemDeletedSuccess(item);
      doListRefresh();
    }).catchError((error) {
      print(error.toString());
    });
  }
}
