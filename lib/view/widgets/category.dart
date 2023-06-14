import 'package:flutter/material.dart';
import 'package:store_app/view/screens/productPage.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({super.key, required this.text, required this.ImgUrl});
  String text;
  String ImgUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(ImgUrl), fit: BoxFit.cover)),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(5),
              color: Colors.white,
              child: Text(
                text.toUpperCase(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
              ),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductPage(categoryName: text),
                      ));
                },
                child: Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "SHOP NOW",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        )
                      ],
                    ))),
          ]),
    );
  }
}
