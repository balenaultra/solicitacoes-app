import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:solicitacoes_app/datas/request_data.dart';
import 'package:solicitacoes_app/models/requests_model.dart';
import 'package:solicitacoes_app/pages/request_page.dart';
import 'package:solicitacoes_app/utils/nav.dart';
import 'package:solicitacoes_app/widgets/text_error.dart';
import 'package:solicitacoes_app/widgets/text.dart';

class RequestsPage extends StatefulWidget {
  @override
  _RequestsPageState createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  final _model = RequestsModel();

  @override
  void initState() {
    _model.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        List<Request> requests = _model.requestList;

        if (_model.error != null) {
          print(_model.error.toString());
          return RefreshIndicator(
            onRefresh: _onRefresh,
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextError(_model.error.toString()),
                  SizedBox(height: 16),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    child: Text("Clique aqui para recarregar"),
                    onPressed: _onRefresh,
                  ),
                ],
              ),
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
            padding: EdgeInsets.all(16),
            child: ListView.builder(
              itemCount: requests != null ? requests.length : 0,
              itemBuilder: (context, index) {
                Request request = requests[index];
                return Container(
                  //height: 380,
                  child: InkWell(
                    onTap: () {
                      _onClickRequest(context, request);
                    },
                    child: Card(
                      color: Colors.grey[100],
                      child: ExpansionTile(
                        //leading: Text(request.requestDate),
                        title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(request.requestTypeDescription),
                              request.response != null
                                  ? Icon(request.response
                                      ? Icons.check_circle_rounded
                                      : Icons.block_outlined)
                                  : Container(),
                            ]),
                        subtitle: Text(request.nameRequester),
                        childrenPadding: EdgeInsets.all(16),
                        expandedCrossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          text(
                            'Detalhes da solicitação',
                            fontSize: 16,
                            bold: true,
                          ),
                          Text(request.requestDetail.replaceAll("\\n", '\n')),
                          SizedBox(
                            height: 10,
                          ),
                          text(
                            'Observação do Operador',
                            fontSize: 16,
                            bold: true,
                          ),
                          text(request.requestMessage),
                        ],
                      ),
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
    print('refresh');
    return _model.fetch();
  }

  _onClickRequest(BuildContext context, Request request) {
    push(context, RequestPage(request));
  }
}
