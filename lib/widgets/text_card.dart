import 'package:flutter/material.dart';

class TextCard extends StatelessWidget {
  final String? label;
  final double fontSize;
  final Color? color;
  final bool? bold;

  const TextCard({Key? key, this.label, this.fontSize = 16, this.color = Colors.black, this.bold = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Text(
        label ?? "",
        style: TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: bold! ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
