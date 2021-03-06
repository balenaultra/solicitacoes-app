import 'package:flutter/material.dart';
import 'package:solicitacoes_app/drawer_list.dart';
import 'package:solicitacoes_app/pages/requests_page.dart';

import 'package:intl/date_symbol_data_local.dart';
import 'package:solicitacoes_app/pages/requests_query_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin<HomePage> {

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting(); //todo testars

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: 'Solicitações'),
              Tab(text: 'Consulta'),
            ],
          ),
          title: Text("Solicitações"),
        ),
        body: TabBarView(
          children: [
            RequestsPage(),
            RequestsQueryPage(),
          ],
        ),
        drawer: DrawerList(),
      ),
    );
  }
}
