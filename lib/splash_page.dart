import 'package:solicitacoes_app/pages/home_page.dart';
import 'package:solicitacoes_app/utils/sql/db_helper.dart';
import 'package:solicitacoes_app/pages/login_page.dart';
import 'package:solicitacoes_app/datas/usuario_data.dart';
import 'package:solicitacoes_app/utils/nav.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future futureBD = DatabaseHelper.getInstance().db;

    Future<Usuario> futureUser = Usuario.get();

    Future.wait([futureBD, futureUser]).then((value) {
      Usuario user = value[1];

      if (user != null) {
        push(context, HomePage(), replace: true);
      } else {
        push(context, LoginPage());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
