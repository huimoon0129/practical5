
class Item{
  int _id; //private data underscore
  String _name;
  double _price;
  String _image;

  Item(this._id, this._name, this._price, this._image); //constructor

  //getter
  int get itemID => _id;
  String get itemName => _name;
  String get itemImage => _image;
  double get itemPrice => _price;


  @override
  String toString() {
    return '$_name (RM $_price)';
  }

}

