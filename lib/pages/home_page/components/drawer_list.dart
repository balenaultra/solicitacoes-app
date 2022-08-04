import 'package:solicitacoes_app/utils/nav.dart';
import 'package:flutter/material.dart';

import '../../../external/middleware/shared_prefs.dart';
import '../../login_page/page/login_page.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Theme.of(context).primaryColor,
        child: ListView(
          children: [
            ListTile(
                leading: Icon(Icons.star, color: Colors.white),
                title: Text(
                  "Favoritos",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                subtitle: Text("Mais informações", style: TextStyle(fontSize: 15, color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                }),
            ListTile(
                leading: Icon(Icons.help, color: Colors.white),
                title: Text("Ajuda", style: TextStyle(fontSize: 18, color: Colors.white)),
                subtitle: Text("Mais informações", style: TextStyle(fontSize: 15, color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                }),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.white),
              title: Text("Logout", style: TextStyle(fontSize: 18, color: Colors.white)),
              onTap: () => _onClickLogout(context),
            ),
          ],
        ),
      ),
    );
  }

  _onClickLogout(BuildContext context) async {
    bool remember = await SharedPref.getBool("remember");
    await getValueShared(remember, context);
  }

  Future<void> getValueShared(
    bool remember,
    BuildContext context,
  ) async {
    if (remember) {
      String companyCPFCNPJ = await SharedPref.getString("companyCPFCNPJ");
      String username = await SharedPref.getString("username");
      String password = await SharedPref.getString("password");
      await goPageLogin(context, remember, companyCPFCNPJ, username, password);
    } else {
      push(context, LoginPage(), replace: true);
    }
    SharedPref.clearShared();
  }

  Future<void> goPageLogin(
      BuildContext context, bool remember, String companyCPFCNPJ, String username, String password) async {
    Navigator.pop(context);
    push(context,
        LoginPage(companyCPFCNPJ: companyCPFCNPJ, username: username, password: password, remember: remember),
        replace: true);
  }
}
