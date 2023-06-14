import 'package:flutter/material.dart';

class ConfirmationPage extends StatelessWidget {
  ConfirmationPage({super.key, required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check_circle_outlined,
                  color: Colors.green,
                  size: 40,
                ),
                Text(
                  "THANKS MR ${text.toUpperCase()} FOR USING OUR APP",
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "You will receive the order within 4 days",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ]),
        ),
      ),
    );
    ;
  }
}
