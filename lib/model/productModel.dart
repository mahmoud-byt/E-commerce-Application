class Product {
  int? id;
  double? price;
  String? title;
  String? description;
  String? category;
  String? imgUrl;
  double? rate;
  bool isFav;
  bool isBought;
  int quantity;
  Product(
      {this.id,
      this.category,
      this.description,
      this.imgUrl,
      this.price,
      this.rate,
      this.title,
      this.isFav = false,
      this.isBought = false,
      this.quantity=1
      });
  factory Product.fromJson(Map<String, dynamic> data) {
    return Product(
      id: data['id'],
      category: data['category'],
      description: data['description'],
      imgUrl: data['image'],
      price: data['price'],
      title: data['title'],
      rate: data['rating']["rate"],
      isFav: false,
      isBought: false,
      quantity: 1
    );
  }
}

class Category {
  String? name;
  Category({this.name});
  factory Category.fromjson(String data) {
    return Category(name: data);
  }
}
