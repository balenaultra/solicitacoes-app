import 'package:flutter/material.dart';

class TextCuston extends StatelessWidget {
  final String? label;
  const TextCuston({Key? key, this.label}) : super(key: key);

  factory TextCuston.host(String label) => TextCuston(label: "Host: $label");
  factory TextCuston.port(String label) => TextCuston(label: "Port: $label");

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Text(
        label ?? "",
        style: TextStyle(fontSize: 20, color: Colors.white),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
