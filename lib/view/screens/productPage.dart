import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/controller/providers/productsProvider.dart';
import 'package:store_app/controller/services/productService.dart';
import 'package:store_app/model/productModel.dart';
import 'package:store_app/view/screens/productDetails.dart';
import 'package:store_app/view/widgets/productWidget.dart';

class ProductPage extends StatefulWidget {
  ProductPage({super.key, required this.categoryName});
  String categoryName;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Product> products = [];
  getProduct() async {
    products =
        await ProductServices().getProductsByCategory(widget.categoryName);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            widget.categoryName.toUpperCase(),
            style: const TextStyle(
                fontStyle: FontStyle.italic, color: Colors.black),
          ),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 3,
              mainAxisSpacing: 15,
              mainAxisExtent: 300),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductWidget(
              url: products[index].imgUrl!,
              title: products[index].title!,
              price: products[index].price!,
              onTAp: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductDetails(prod: products[index]),
                    ));
              },
            );
          },
        ));
  }
}
