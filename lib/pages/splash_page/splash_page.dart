import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:solicitacoes_app/pages/home_page/page/home_page.dart';
import 'package:solicitacoes_app/utils/nav.dart';
import 'package:flutter/material.dart';

import '../../external/middleware/shared_prefs.dart';
import '../../external/middleware/connection_shared.dart';
import '../login_page/page/login_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    try {
      Future companyCPFCNPJ = SharedPref.getString("companyCPFCNPJ");
      Future username = SharedPref.getString("username");
      Future password = SharedPref.getString("password");
      Future remember = SharedPref.getBool("remember");
      Future token = SharedPref.getString("token");
      Future host = SharedPref.getString("host");
      Future port = SharedPref.getString("port");
      final ConnectionShared requestsShared = ConnectionShared();

      Future.wait([companyCPFCNPJ, username, password, remember, token, host, port]).then((value) {
        if (value[0] != "" &&
            value[1] != "" &&
            value[2] != "" &&
            value[4] != "" &&
            value[5] != "" &&
            value[6] != "") {
          if (JwtDecoder.isExpired(value[4])) {
            push(
                context,
                LoginPage(
                    companyCPFCNPJ: value[0], username: value[1], password: value[2], remember: value[3]),
                replace: true);
          } else {
            requestsShared.setToken(value[4]);
            requestsShared.setHost(value[5]);
            requestsShared.setPort(value[6]);

            push(context, HomePage(), replace: true);
          }
        } else {
          push(context,
              LoginPage(companyCPFCNPJ: value[0], username: value[1], password: value[2], remember: value[3]),
              replace: true);
        }
      });
    } catch (e) {
      push(context, LoginPage(), replace: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
