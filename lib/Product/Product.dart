
class Product{
  int _id;
  String _name;
  double _price;
  String _image;

  //Constructor with initializing formal parameters
  Product(this._id, this._name, this._price, this._image);

  int get itemID => _id;

  String get itemName => _name;

  double get price => _price;

  String get image => _image;

  @override
  String toString() {
    return '$_name RM$_price';
  }

}

