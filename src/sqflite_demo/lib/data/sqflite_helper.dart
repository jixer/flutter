import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_demo/models/item.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper.internal();

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "main.db");
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database db, int version) async {
    try{
      await db.execute("CREATE TABLE Item(id TEXT, elementText TEXT)");
    }
    catch(ex){
      print("Error creating database, exclusive exception");
    }

    print("Table is created");
  }

  // insertion
  Future<int> saveItem(Item item) async {
    var dbClient = await db;
    int res = await dbClient.insert("Item", item.toMap());
    return res;
  }

  //deletion
  Future<int> deleteItem(Item item) async {
    var dbClient = await db;
    int res =
        await dbClient.rawDelete('DELETE FROM Item WHERE id = ?', [item.id]);
    return res;
  }

  // read
  Future<List<Item>> getItems() async {
    var dbClient = await db;
    List<Map> items =
        await dbClient.rawQuery('SELECT * FROM Item');

    List<Item> resultItems = new List<Item>();

    if (items.iterator != null) {
      items.forEach((item) {
        resultItems.add(new Item.fromMap(item));
      });
    }

    return resultItems;
  }
}
