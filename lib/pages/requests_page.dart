import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:solicitacoes_app/api/request_api.dart';
import 'package:solicitacoes_app/api/stream_api.dart';
import 'package:solicitacoes_app/datas/request_data.dart';

import 'package:solicitacoes_app/models/requests_model.dart';
import 'package:solicitacoes_app/utils/api_response.dart';
import 'package:solicitacoes_app/widgets/app_button.dart';
import 'package:solicitacoes_app/widgets/card.dart';
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
    StreamApi.subscribe("request", () {
      _model.fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        List<Request>? requests = _model.requestList;

        if (_model.error != null) {
          print("model error>> " + _model.error.toString());
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
                return RequestCard(
                  request,
                  onPressAceitar: () {
                    acceptRequest(request);
                  },
                  onPressRejeitar: () {
                    acceptRequest(request, accept: false);
                  },
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
