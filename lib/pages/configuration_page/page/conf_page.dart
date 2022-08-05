import 'package:flutter/material.dart';

import '../../../widgets/app_button.dart';
import '../../login_page/controllers/login_controller.dart';
import '../components/text_custon.dart';

class ConfigPage extends StatelessWidget {
  final String? host;
  final String? port;
  final LoginController? loginController;
  const ConfigPage({Key? key, this.host, this.port, this.loginController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(top: 20),
        color: Theme.of(context).primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextCuston.host(host ?? ""),
            TextCuston.port(port ?? ""),
            Visibility(
              visible:
                  loginController!.username.text != "" && loginController!.password.text != "" ? true : false,
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Center(
                  child: AppButton.config(
                    onPressed: () => {loginController!.confirmLogin(context)},
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
