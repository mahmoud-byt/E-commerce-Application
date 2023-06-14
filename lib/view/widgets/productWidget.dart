import 'package:flutter/material.dart';
import 'package:store_app/view/widgets/customButton.dart';

class ProductWidget extends StatelessWidget {
  String url;
  String title;
  double price;
  Function() onTAp;
  ProductWidget(
      {required this.url,
      required this.title,
      required this.price,
      required this.onTAp});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Image(
          image: NetworkImage(url),
          width: double.infinity,
          height: 200,
        ),
        Text(
          title,
          style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 14,
              color: Colors.grey),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: Text(
            '$price EGP',
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        CustomButton(
          onTap: onTAp,
          text: "MORE DETAILS",
          colors: const [
            Color(0xffA9F1DF),
            Color(0xffFFBBBB),
          ],
        ),
      ],
    ));
  }
}
