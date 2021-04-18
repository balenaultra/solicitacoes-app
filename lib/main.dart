
import 'package:flutter/material.dart';
import 'package:solicitacoes_app/splash_page.dart';
import 'package:solicitacoes_app/utils/color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff152F3E),
        //primarySwatch: MaterialColor(0, Color(0xff152F3E), ),// ||//createMaterialColor(Color(0xff152F3E)),
        //text
        //accentColor: Colors.white,
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashPage(),
    );
  }
}
