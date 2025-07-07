
class Item{
  int _id;
  String _name;

  Item(this._id, this._name);

  int get itemID => _id;

  String get itemName => _name;


  @override
  String toString() {
    return '$_id $_name';
  }

}

