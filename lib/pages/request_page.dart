import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solicitacoes_app/datas/request_data.dart';
import 'package:solicitacoes_app/widgets/app_text.dart';
import 'package:solicitacoes_app/widgets/text.dart';

class RequestPage extends StatefulWidget {
  final Request request;

  RequestPage(this.request);

  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  Request get request => widget.request;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(request.requestTypeDescription),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text("Operador solicitante", fontSize: 16),
            text(request.nameRequester, fontSize: 20, bold: true),
            Divider(),
            text("Detalhes da solicitação", fontSize: 22),
            text(request.requestDetail.replaceAll("/s", '\n'), fontSize: 22),
            Divider(),
            text("Mensagem do solicitante", fontSize: 18),
            text(request.requestMessage, fontSize: 22),
            Divider(),
            AppText("Mensagem de resposta", ""),

          ],
        ),
      ),
    );
  }
}
