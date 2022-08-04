import 'package:flutter/material.dart';
import 'package:solicitacoes_app/pages/home_page/components/drawer_list.dart';
import '../../resquest_pages/page/requests_page.dart';
import '../../resquest_pages/page/requests_page_pending.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text(
                  "Solicitações",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Tab(
                child: Text(
                  "Consulta",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
          title: Text("Solicitações"),
        ),
        body: TabBarView(
          children: [
            RequestsPagePending(),
            RequestsPage(),
          ],
        ),
        drawer: DrawerList(),
      ),
    );
  }
}
