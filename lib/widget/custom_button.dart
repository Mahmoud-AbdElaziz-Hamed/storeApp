// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.text,
    this.onTap,
    required this.size,
    required this.bgcolor,
  });
  final String text;
  final Color bgcolor;

  final double size;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: bgcolor,
            borderRadius: BorderRadiusDirectional.circular(16),
            border: Border.all(
              color: Colors.black,
            )),
        padding: const EdgeInsets.all(12),
        child: Center(
            child: Text(
          text,
          style: TextStyle(fontSize: size),
        )),
      ),
    );
  }
}
