import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/controller/providers/productsProvider.dart';
import 'package:store_app/controller/services/productService.dart';
import 'package:store_app/model/productModel.dart';
import 'package:store_app/view/screens/productDetails.dart';

import '../widgets/customFormField.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Product> products = [];
  getProducts() async {
    products = await ProductServices().getAllProducts();
    setState(() {});
  }

  void initState() {
    super.initState();
    getProducts();
  }

  @override
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Text(
              "SEARCH",
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            foregroundColor: Colors.black),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomFormField(
                  controller: controller,
                  icon: Icons.search,
                  onChanged: (val) {
                    context
                        .read<ProductProvider>()
                        .searchForAproduct(products, val);
                  },
                  keypoardType: TextInputType.text,
                  placeholder: "Search for any product ..."),
            ),
            Expanded(child: Consumer<ProductProvider>(
              builder: (context, value, child) {
                return ListView.builder(
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductDetails(prod: value.searches[index]),
                          ));
                    },
                    child: Container(
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.search,
                              size: 12,
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Expanded(
                              child: Text(
                                value.mysearches[index].title!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            )
                          ],
                        )),
                  ),
                  itemCount: value.mysearches.length,
                );
              },
            ))
          ],
        ));
  }
}
