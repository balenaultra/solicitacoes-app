import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:solicitacoes_app/api/request_api.dart';
import 'package:solicitacoes_app/api/stream_api.dart';
import 'package:solicitacoes_app/datas/request_data.dart';

import 'package:solicitacoes_app/models/requests_model.dart';
import 'package:solicitacoes_app/pages/request_page.dart';
import 'package:solicitacoes_app/utils/api_response.dart';
import 'package:solicitacoes_app/utils/nav.dart';
import 'package:solicitacoes_app/widgets/app_button.dart';
import 'package:solicitacoes_app/widgets/text_error.dart';
import 'package:solicitacoes_app/widgets/text.dart';

class RequestsPage extends StatefulWidget {
  final bool pendentes;

  RequestsPage({this.pendentes = true});

  @override
  _RequestsPageState createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  final _model = RequestsModel();

  bool get pendentes => widget.pendentes;

  @override
  void initState() {
    _model.fetch();
    if (this.pendentes) {
      print('initstate');
      //TODO controlar melhor os registros
      StreamApi.subscribe("request", () {
        _model.fetch();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        List<Request>? requests = _model.requestList;

        if (_model.error != null) {
          print("modal error>> " + _model.error.toString());
          return Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextError(_model.error.toString()),
                SizedBox(height: 16),
                AppButton(
                  "Clique aqui para tentar recarregar",
                  onPressed: _onRefresh,
                ),
              ],
            ),
          );
        }

        if (requests == null) {
          return Container(
            child: CircularProgressIndicator(),
          );
        }

        return RefreshIndicator(
          onRefresh: _onRefresh,
          child: Container(
            padding: EdgeInsets.all(14),
            child: ListView.builder(
              itemCount: requests != null ? requests.length : 0,
              itemBuilder: (context, index) {
                Request request = requests[index];
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
                              onPressed: () {
                                acceptRequest(request);
                              },
                              primaryColor: Colors.green,
                              height: 36,
                              textFontSize: 15,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            AppButton(
                              'Rejeitar',
                              onPressed: () {
                                acceptRequest(request, accept: false);
                              },
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
              },
            ),
          ),
        );
      },
    );
  }

  Future<void> _onRefresh() {
    return _model.fetch();
  }

  _onClickRequest(BuildContext context, Request request) {
    push(context, RequestPage(request));
  }

  void acceptRequest(Request request, {bool accept = true}) async {
    request.response = accept;

    ApiResponse response = await RequestApi.update(request);

    if (response.ok) {
      print("req page response >> ok");
    } else {
      print("req page response error ${response.msg}");
    }
  }

  @override
  void dispose() {
    //StreamApi.unsubscribe();
    super.dispose();
  }
}
