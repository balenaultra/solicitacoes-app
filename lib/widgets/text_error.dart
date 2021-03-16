import 'package:flutter/material.dart';

class TextError extends StatelessWidget {
  final String msg;

  TextError(this.msg);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        msg,
        style: TextStyle(fontSize: 22, color: Colors.red),
      ),
    );
  }
}
