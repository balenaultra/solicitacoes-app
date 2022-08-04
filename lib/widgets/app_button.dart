import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function? onPressed;
  final bool showProgress;
  final Color primaryColor;
  final Color? textColor;
  final double textFontSize;
  final double height;

  AppButton(
    this.text, {
    this.onPressed,
    this.showProgress = false,
    this.primaryColor = Colors.black,
    this.textColor,
    this.textFontSize = 22,
    this.height = 46,
  });

  factory AppButton.login({Function? onPressed, bool, bool? showProgress}) =>
      AppButton("Login", onPressed: onPressed);

  factory AppButton.config({Function? onPressed, bool}) => AppButton(
        "Continuar com o login",
        onPressed: onPressed,
        height: 35,
        textFontSize: 18,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      height: height,
      child: ElevatedButton(
        onPressed: onPressed as void Function()?,
        style: ElevatedButton.styleFrom(
          primary: primaryColor,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
          ),
        ),
        child: showProgress
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).selectedRowColor),
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  color: textColor ?? Theme.of(context).selectedRowColor,
                  fontSize: textFontSize,
                ),
              ),
      ),
    );
  }
}
