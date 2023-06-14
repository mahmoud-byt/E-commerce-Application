import 'package:flutter/material.dart';

class QuantityCounter extends StatelessWidget {
  QuantityCounter(
      {super.key,
      required this.increament,
      required this.decreament,
      required this.quantity});
  Function() increament;
  Function() decreament;
  int quantity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          GestureDetector(
            onTap: decreament,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(4)),
              child: const Icon(
                Icons.remove,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              quantity.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          GestureDetector(
            onTap: increament,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(4)),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
