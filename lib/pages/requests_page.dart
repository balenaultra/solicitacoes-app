import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:solicitacoes_app/datas/request_data.dart';
import 'package:solicitacoes_app/models/requests_model.dart';
import 'package:solicitacoes_app/pages/request_page.dart';
import 'package:solicitacoes_app/utils/nav.dart';
import 'package:solicitacoes_app/widgets/text_error.dart';

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
          return TextError(_model.error.toString());
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
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              request.requestTypeDescription,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 25),
                            ),
                            Text(
                              request.nameRequester,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 16),
                            ),
                            ButtonBarTheme(
                              data: ButtonBarTheme.of(context),
                              child: ButtonBar(
                                children: <Widget>[
                                  TextButton(
                                    child: const Text('DETALHES'),
                                    onPressed: () =>
                                        _onClickRequest(context, request),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
    return _model.fetch();
  }

  _onClickRequest(BuildContext context, Request request) {
    push(context, RequestPage(request));
  }
}
