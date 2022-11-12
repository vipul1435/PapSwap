import 'package:flutter/material.dart';

class Utils {
  void error(BuildContext context,String error) {
    final snack = SnackBar(
      content: Text(error),
      backgroundColor: Colors.red,
      duration:const Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }
}
