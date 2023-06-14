import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/controller/providers/productsProvider.dart';
import 'package:store_app/model/productModel.dart';
import 'package:store_app/view/screens/CardPage.dart';
import 'package:store_app/view/screens/favouritesPage.dart';
import 'package:store_app/view/widgets/customButton.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({super.key, required this.prod});
  Product prod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "DETAILS",
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        foregroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Favourites(),
                    ));
              },
              icon: const Icon(Icons.favorite_border)),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CardPage(),
                    ));
              },
              icon: const Icon(Icons.shopping_bag_outlined)),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(5),
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image(
                image: NetworkImage(prod.imgUrl!),
                height: MediaQuery.of(context).size.height / 2,
                fit: BoxFit.contain,
              ),
              Positioned(
                  top: 5,
                  right: 5,
                  child: Consumer<ProductProvider>(
                    builder: (context, value, child) {
                      return GestureDetector(
                        onTap: () {
                          value.makeItFav(prod);
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.black54,
                          radius: 20,
                          child: Icon(
                            Icons.favorite,
                            size: 20,
                            color:
                                prod.isFav == false ? Colors.white : Colors.red,
                          ),
                        ),
                      );
                    },
                  ))
            ],
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              prod.title!,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            prod.description!,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(
            height: 5,
          ),
          Text('${prod.price} EGP',
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 10,
          ),
          Consumer<ProductProvider>(
            builder: (context, value, child) {
              return CustomButton(
                colors: prod.isBought
                    ? [Colors.black54, Colors.black45]
                    : [
                        Color(0xffA9F1DF),
                        Color(0xffFFBBBB),
                      ],
                borderRadius: 8,
                margin: 40,
                padding: 8,
                onTap: prod.isBought
                    ? null
                    : () {
                        value.addToCard(prod);
                      },
                text: prod.isBought ? "ADDED" : "ADD TO CARD",
              );
            },
          ),
        ],
      ),
    );
  }
}
