import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  CustomFormField(
      {super.key,
      required this.placeholder,
      required this.icon,
      required this.keypoardType,
      @required this.controller,
      @required this.onChanged});
  String placeholder;
  IconData icon;
  TextEditingController? controller;
  TextInputType keypoardType;
  Function(String val)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      keyboardType: keypoardType,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintStyle: const TextStyle(fontSize: 14),
        hintText: placeholder,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Colors.grey)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Colors.grey)),
      ),
    );
  }
}
