import 'package:flutter/material.dart';

class CustomsearchField extends StatelessWidget {
  const CustomsearchField({super.key, required this.hintText});
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) {},
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          hintText: hintText,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          border: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Color.fromARGB(15, 110, 110, 110),
            style: BorderStyle.solid,
          ))),
    );
  }
}
