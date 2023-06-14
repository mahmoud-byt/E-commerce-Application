import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/controller/providers/productsProvider.dart';
import 'package:store_app/view/screens/HomePage.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ProductProvider(),
    child: MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    ),
  ));
}
