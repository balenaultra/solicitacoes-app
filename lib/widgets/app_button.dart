import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool showProgress;

  AppButton(this.text, {this.onPressed, this.showProgress = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
        ),
        child: showProgress
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).accentColor),
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 22,
                ),
              ),
      ),
    );
  }
}
