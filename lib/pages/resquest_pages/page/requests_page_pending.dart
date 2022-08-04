import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:solicitacoes_app/widgets/card.dart';
import '../controller/requests_controller.dart';

class RequestsPagePending extends StatelessWidget {
  final ResquestsController _resquestsController = ResquestsController();

  @override
  Widget build(BuildContext context) {
    _resquestsController.requestsStore.getSolicitationRequest(true);

    return Observer(builder: (_) {
      if (_resquestsController.requestsStore.listSolicitationEntity.length > 0) {
        return Container(
          padding: EdgeInsets.all(14),
          child: ListView.builder(
            itemCount: _resquestsController.requestsStore.listSolicitationEntity.length,
            itemBuilder: (context, index) {
              return RequestCard(
                _resquestsController.requestsStore.listSolicitationEntity[index],
                pending: true,
                onPressAccept: () {
                  _resquestsController
                      .acceptRequests(_resquestsController.requestsStore.listSolicitationEntity[index]);
                },
                onPressReject: () {
                  _resquestsController
                      .rejectRequests(_resquestsController.requestsStore.listSolicitationEntity[index]);
                },
                textFormField: TextFormField(
                  style: TextStyle(fontSize: 18),
                  onChanged: (value) {
                    _resquestsController.changeRequestedDescription(
                        _resquestsController.requestsStore.listSolicitationEntity[index], value);
                  },
                ),
              );
            },
          ),
        );
      } else {
        if (_resquestsController.requestsStore.loading) {
          return Center(
            child: Container(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return Center(
            child: Text(
              "Não possui solicitações.",
              style: TextStyle(fontSize: 20),
            ),
          );
        }
      }
    });
  }
}
