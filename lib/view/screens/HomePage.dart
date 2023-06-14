import 'dart:math';
import 'package:flutter/material.dart';
import 'package:store_app/controller/services/productService.dart';
import 'package:store_app/view/screens/searchPage.dart';
import 'package:store_app/view/widgets/category.dart';

import '../../model/productModel.dart';
import 'CardPage.dart';
import 'favouritesPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  List<Category> categories = [];
  getCategories() async {
    categories = await ProductServices().getAllCategories();
    setState(() {});
  }

  void initState() {
    getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchPage(),
                    ));
              },
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              )),
          centerTitle: true,
          title: const Text(
            "MY STORE",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Favourites(),
                      ));
                },
                icon: const Icon(
                  Icons.favorite_border,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CardPage(),
                      ));
                },
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.black,
                ))
          ],
        ),
        body: PageView.builder(
          itemBuilder: (context, index) => CategoryWidget(
            text: categories[index].name!,
            ImgUrl: '${index}.jpeg',
          ),
          itemCount: categories.length,
          scrollDirection: Axis.vertical,
        ));
  }
}
