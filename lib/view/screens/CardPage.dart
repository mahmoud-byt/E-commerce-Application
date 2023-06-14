import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:store_app/controller/providers/productsProvider.dart';
import 'package:store_app/view/screens/checkoutPage.dart';
import 'package:store_app/view/widgets/customButton.dart';
import 'package:store_app/view/widgets/quantityCounter.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "CARD",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          foregroundColor: Colors.black),
      body: Consumer<ProductProvider>(
        builder: (context, value, child) {
          return value.card.isNotEmpty
              ? Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                            itemCount: value.card.length,
                            itemBuilder: (context, i) => Dismissible(
                                  onDismissed: (direction) {
                                    value.removeFromCard(value.card[i]);
                                  },
                                  background: Container(
                                    color: Colors.grey,
                                  ),
                                  key: ValueKey(value.card[i]),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Card(
                                      elevation: 6,
                                      child: ListTile(
                                        leading: Image(
                                            image: NetworkImage(
                                                value.card[i].imgUrl!)),
                                        title: Column(
                                          children: [
                                            Text(
                                              value.card[i].title!,
                                              style: const TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ),
                                            QuantityCounter(
                                                increament: () {
                                                  value.increaseQuantity(
                                                      value.card[i]);
                                                  print(value.card[i].quantity);
                                                },
                                                decreament: () {
                                                  value.decreaseQuantity(
                                                      value.card[i]);
                                                },
                                                quantity:
                                                    value.card[i].quantity)
                                          ],
                                        ),
                                        subtitle: Text(
                                          '${value.card[i].price} EGP',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        trailing: IconButton(
                                            onPressed: () {
                                              value.removeFromCard(
                                                  value.card[i]);
                                            },
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            )),
                                      ),
                                    ),
                                  ),
                                ))),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: CustomButton(
                          onTap: () {
                            value.calculateTotalPrice();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CheckOut(),
                                ));
                          },
                          padding: 4,
                          text: "CHECKOUT",
                          borderRadius: 4,
                          margin: 20,
                          colors: const [
                            Color(0xffA9F1DF),
                            Color(0xffFFBBBB),
                          ]),
                    )
                  ],
                )
              : Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "SORRY YOU HAVEN'T ADDED TO YOUR CARD YET",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        FontAwesomeIcons.faceFrownOpen,
                        color: Colors.yellow,
                      )
                    ],
                  ),
                );
        },
      ),
    );
  }
}
