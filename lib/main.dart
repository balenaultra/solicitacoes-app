
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
        primarySwatch: createMaterialColor(Color(0xff152F3E)),
        accentColor: Colors.white,
        brightness: Brightness.light,
        //scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashPage(),
    );
  }
}
