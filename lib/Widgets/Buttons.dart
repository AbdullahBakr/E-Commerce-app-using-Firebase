import 'package:flutter/material.dart';
import 'color.dart';
// ignore_for_file: prefer_const_constructors

class Buttons extends StatelessWidget {
  final String? text;
  const Buttons({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: MaterialButton(
        color: blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        textColor: white,
        onPressed: (){},
        child: Text(text!),
      ),
    );
  }
}
