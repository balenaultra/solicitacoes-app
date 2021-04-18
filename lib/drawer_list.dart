import 'package:solicitacoes_app/datas/usuario_data.dart';
import 'package:solicitacoes_app/utils/nav.dart';
import 'package:flutter/material.dart';

import 'pages/login_page.dart';

class DrawerList extends StatelessWidget {
  UserAccountsDrawerHeader _header(Usuario user) {
    return UserAccountsDrawerHeader(
      accountName: Text(user.name ?? 'Nome'),
      accountEmail: Text(user.email!), // ?? 'E-Mail' as Widget?,
      currentAccountPicture: CircleAvatar(
        backgroundImage: NetworkImage("https://icons.iconarchive.com/icons/paomedia/small-n-flat/512/user-male-icon.png"),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    Future<Usuario?> future = Usuario.get();

    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            FutureBuilder<Usuario?>(
              future: future,
              builder: (context, snapshot) {
                Usuario? user = snapshot.data;
                return user != null ? _header(user) : Container();
              },
            ),
            ListTile(
                leading: Icon(Icons.star),
                title: Text("Favoritos"),
                subtitle: Text("Mais informações"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  print("Opção 1");
                  Navigator.pop(context);
                }),
            ListTile(
                leading: Icon(Icons.help),
                title: Text("Ajuda"),
                subtitle: Text("Mais informações"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  print("Opção 1");
                  Navigator.pop(context);
                }),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () => _onClickLogout(context),
            ),
          ],
        ),
      ),
    );
  }

  _onClickLogout(BuildContext context) {
    Usuario.clear();
    Navigator.pop(context);
    push(context, LoginPage(), replace: true);
  }
}
