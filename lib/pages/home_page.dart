import 'package:flutter/material.dart';
import 'package:solicitacoes_app/api/request_api.dart';
import 'package:solicitacoes_app/drawer_list.dart';
import 'package:solicitacoes_app/pages/requests_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Solicitações"),
      ),
      body: RequestsPage(),
      drawer: DrawerList(),
    );
  }

  @override
  void initState() {
    RequestApi.fetch();
  }
}
