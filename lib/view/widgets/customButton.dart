import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      @required this.onTap,
      @required this.padding,
      @required this.text,
      @required this.borderRadius,
      @required this.margin,
      @required this.colors
      });
  Function()? onTap;
  double? padding;
  double? margin;
  double? borderRadius;
  String? text;
  List<Color>? colors;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: margin ??= 0),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ??= 0),
            gradient:  LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: colors!)),
        padding: EdgeInsets.symmetric(vertical: padding ??= 5),
        alignment: Alignment.center,
        child: Text(
          text ??= "ADD NAME",
          style: const TextStyle(
              color: Colors.black45, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
