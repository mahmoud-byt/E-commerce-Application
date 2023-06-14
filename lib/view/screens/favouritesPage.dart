import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/controller/providers/productsProvider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "FAVOURITES",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          foregroundColor: Colors.black),
      body: Consumer<ProductProvider>(
        builder: (context, value, child) {
          return value.favs.isNotEmpty
              ? ListView.builder(
                  itemCount: value.favs.length,
                  itemBuilder: (context, i) => Dismissible(
                        onDismissed: (direction) {
                          value.removeFromFavs(value.favs[i]);
                        },
                        background: Container(
                          color: Colors.grey,
                        ),
                        key: ValueKey(value.favs[i]),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Card(
                            elevation: 6,
                            child: ListTile(
                                                           leading: Image(
                                  image: NetworkImage(value.favs[i].imgUrl!)),
                              title: Text(
                                value.favs[i].title!,
                                style: const TextStyle(
                                    overflow: TextOverflow.ellipsis),
                              ),
                              
                              subtitle: Text(
                                '${value.favs[i].price} EGP',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    value.removeFromFavs(value.favs[i]);
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  )),
                            ),
                          ),
                        ),
                      ))
              : Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "SORRY YOUR FAVOURITES LIST IS EMPTY",
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
