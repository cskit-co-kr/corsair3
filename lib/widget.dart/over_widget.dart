import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class OverWidget extends StatefulWidget {
  OverWidget({Key? key}) : super(key: key);

  @override
  State<OverWidget> createState() => _OverWidgetState();
}

class _OverWidgetState extends State<OverWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        'You scored',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      )),
    );
  }
}
