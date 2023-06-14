import 'package:flutter/material.dart';
import 'package:store_app/model/productModel.dart';

class ProductProvider with ChangeNotifier {
  List<Product> favourites = [];
  List<Product> cardList = [];
  List<Product> searches = [];

  double totalPrice = 0;
  makeItFav(Product prod) {
    prod.isFav = !prod.isFav;
    if (prod.isFav) {
      favourites.add(prod);
    } else {
      favourites.remove(prod);
    }
    notifyListeners();
  }

  removeFromFavs(Product prod) {
    favourites.remove(prod);
    prod.isFav = false;
    notifyListeners();
  }

  addToCard(Product prod) {
    cardList.add(prod);
    prod.isBought = true;
    notifyListeners();
  }

  removeFromCard(Product prod) {
    cardList.remove(prod);
    prod.isBought = false;
    notifyListeners();
  }

  increaseQuantity(Product prod) {
    prod.quantity++;
    notifyListeners();
  }

  decreaseQuantity(Product prod) {
    if (prod.quantity > 1) {
      prod.quantity--;
    }
    notifyListeners();
  }

  calculateTotalPrice() {
    totalPrice = card
        .map((prod) => prod.price! * prod.quantity)
        .reduce((prod1, prod2) => prod1 + prod2);
  }

  searchForAproduct(List<Product> prods, String val) {
    searches = [];
    for (var prod in prods) {
      if (prod.title!.toLowerCase().contains(val)) {
        searches.add(prod);
      }
    }
    notifyListeners();
  }

  List<Product> get favs => favourites;
  List<Product> get card => cardList;
  double get totalMoney => totalPrice;
  List<Product> get mysearches => searches;
}
