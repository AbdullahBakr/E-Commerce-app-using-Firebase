import 'package:flutter/material.dart';
class showSnackBar1 extends StatelessWidget {
  const showSnackBar1({super.key});
  showSnackBar(BuildContext context, String text) {

    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      // width: 20,
      behavior: SnackBarBehavior.floating,
      // backgroundColor: Colors.grey,
      duration: Duration(seconds: 2),
      content: Text(text),

      action: SnackBarAction(label: "close", onPressed: () {}),
    ));
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


