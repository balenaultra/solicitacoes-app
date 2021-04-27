import 'package:flutter/material.dart';
import 'package:solicitacoes_app/datas/request_data.dart';
import 'package:solicitacoes_app/widgets/app_button.dart';
import 'package:solicitacoes_app/widgets/text.dart';

class RequestCard extends StatefulWidget {
  late final Request request;
  Function? onPressAceitar;
  Function? onPressRejeitar;

  RequestCard(this.request,
  {this.onPressAceitar,
  this.onPressRejeitar});

  @override
  _RequestCardState createState() => _RequestCardState();
}

class _RequestCardState extends State<RequestCard> {

  Request get request => widget.request;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: ExpansionTile(
          //leading: Text(request.requestDate),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(request.requestTypeDescription!),
              request.response != null
                  ? Icon(request.response!
                  ? Icons.check_circle_rounded
                  : Icons.block_outlined)
                  : Container(),
            ],
          ),
          subtitle: Text(request.nameRequester!),
          childrenPadding: EdgeInsets.all(16),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            text(
              'Detalhes da solicitação',
              fontSize: 16,
              bold: true,
            ),
            text(
              request.requestDetail!.replaceAll("\\n", '\n'),
              fontSize: 16,
            ),
            SizedBox(
              height: 10,
            ),
            text(
              'Observação do Operador',
              fontSize: 16,
              bold: true,
            ),
            text(request.requestMessage),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                AppButton(
                  'Aceitar',
                  onPressed: widget.onPressAceitar,
                  primaryColor: Colors.green,
                  height: 36,
                  textFontSize: 15,
                ),
                SizedBox(
                  width: 16,
                ),
                AppButton(
                  'Rejeitar',
                  onPressed: widget.onPressRejeitar,
                  primaryColor: Colors.red,
                  textColor: Colors.black,
                  height: 36,
                  textFontSize: 15,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
