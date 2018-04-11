import 'package:uuid/uuid.dart';

class Item{
  String elementText;
  String _id;

  Item(this.elementText, ){
    var uuid = new Uuid();
    _id = uuid.v1();
  }

  Item.withKnownId(this.elementText, this._id);

  get id{
    return _id;
  }

  Item.fromMap(Map obj)
  {
    this._id = obj["id"];
    this.elementText = obj["elementText"];
  }

  Map<String, dynamic> toMap(){
    var map = new Map<String, dynamic>();
    map["elementText"] = elementText.toString();
    map["id"] = _id.toString();
    return map;
  }
}