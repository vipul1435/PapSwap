import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomProgressIndicator extends StatelessWidget {
  final Color color;
  final double? value;
  const CustomProgressIndicator(
      {Key? key, this.color = Colors.blue, this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: SpinKitWave(
        color: Colors.white,
      )
    );
  }
}