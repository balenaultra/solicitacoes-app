import 'package:flutter/material.dart';

alert(BuildContext context, String? msg, {Function? callback}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          title: Text(
            "Notificação",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          content: Text(msg!, style: TextStyle(fontSize: 18, color: Colors.black)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                if (callback != null) {
                  callback();
                }
              },
              child: Text(
                "OK",
                style: TextStyle(color: Colors.black, fontSize: 19),
              ),
            ),
          ],
        ),
      );
    },
  );
}
