import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String label;
  final String hint;
  final bool password;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final FocusNode focusNode;
  final FocusNode nextFocus;

  AppText(
    this.label,
    this.hint, {
    this.password = false,
    this.controller,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,
    this.nextFocus,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: (String text) {
        if (nextFocus != null) FocusScope.of(context).requestFocus(nextFocus);
      },
      cursorColor: Theme.of(context).accentColor,
      style: TextStyle(
        fontSize: 20,
        color: Theme.of(context).accentColor,
      ),
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).accentColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).accentColor),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).accentColor),
        ),
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 25,
          color: Theme.of(context).accentColor,
        ),
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 16,
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
