import 'dart:js_util';

import 'package:dio/dio.dart';
import 'package:store_app/model/productModel.dart';

final dio = Dio();

class ProductServices {
  List<Product> products = [];
  List<Product> allProducts = [];
  List<Category> categories = [];
  Future<List<Product>> getProductsByCategory(String catname) async {
    try {
      Response response = await dio.get('https://fakestoreapi.com/products/category/${catname}');
      response.data.forEach((prod) => {products.add(Product.fromJson(prod))});
    } catch (e) {
      print(e);
    }
    return products;
  }
  Future<List<Product>> getAllProducts() async {
    try {
      Response response = await dio.get('https://fakestoreapi.com/products');
      response.data.forEach((prod) => {allProducts.add(Product.fromJson(prod))});
    } catch (e) {
      print(e);
    }
    return allProducts;
  }

  Future<List<Category>> getAllCategories() async {
    try {
      Response response =
          await dio.get('https://fakestoreapi.com/products/categories');
      response.data.forEach((cat) => {categories.add(Category.fromjson(cat))});
    } catch (e) {
      print(e);
    }
    return categories;
  }
}
