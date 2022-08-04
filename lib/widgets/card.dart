import 'package:flutter/material.dart';
import 'package:solicitacoes_app/widgets/app_button.dart';
import 'package:solicitacoes_app/widgets/text_card.dart';

import '../entities/solicitation_entity.dart';
import '../utils/date_format_utils.dart';

// ignore: must_be_immutable
class RequestCard extends StatelessWidget {
  final SolicitationEntity? _solicitationEntity;
  final Function? onPressAccept;
  final Function? onPressReject;
  final bool? pending;
  final Widget? textFormField;

  RequestCard(this._solicitationEntity,
      {this.pending, this.onPressAccept, this.onPressReject, this.textFormField});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(08.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(08.0),
        child: ExpansionTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                textDate(pending!, _solicitationEntity!),
                style: TextStyle(fontSize: 17),
              ),
              Icon(
                iconCard(_solicitationEntity!.authorization ?? false),
                color: color(_solicitationEntity!.authorization ?? false),
              )
            ],
          ),
          subtitle: Text('${_solicitationEntity!.dscTypeRequested!}'),
          childrenPadding: EdgeInsets.all(16),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextCard(
              label: 'Detalhes da solicitação',
              fontSize: 18,
              bold: true,
            ),
            TextCard(
              label: formatText("${_solicitationEntity!.detail!}"),
              fontSize: 17,
            ),
            SizedBox(
              height: 10,
            ),
            TextCard(
              label: 'Observação do Operador',
              fontSize: 18,
              bold: true,
            ),
            Container(child: textFormField ?? SizedBox()),
            TextCard(label: '${!pending! ? _solicitationEntity!.dscSolicitor ?? "" : ""}'),
            SizedBox(
              height: 10,
            ),
            Visibility(
              visible: isVisible(pending!, _solicitationEntity!),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppButton(
                    'Aceitar',
                    onPressed: onPressAccept,
                    primaryColor: Colors.green,
                    textColor: Colors.white,
                    height: 36,
                    textFontSize: 18,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  AppButton(
                    'Rejeitar',
                    onPressed: onPressReject,
                    primaryColor: Colors.red,
                    textColor: Colors.white,
                    height: 36,
                    textFontSize: 18,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String textDate(bool pending, SolicitationEntity _solicitationEntity) =>
      DateFormatUtils.formatDateTimeFromDateString(DateFormatUtils.formatDateStringFromDateTime(
          pending ? _solicitationEntity.dateSolicitation! : _solicitationEntity.dateAnswer!));

  bool isVisible(bool pending, SolicitationEntity _solicitationEntity) {
    if (pending) {
      return _solicitationEntity.authorization ?? true;
    } else {
      return false;
    }
  }

  IconData iconCard(bool typeIcon) => typeIcon ? Icons.check_circle_rounded : Icons.block_outlined;

  Color color(bool typeIcon) => typeIcon ? Colors.green : Colors.red;

  String formatText(String detail) {
    return detail.replaceAll(RegExp('[\r]'), '').replaceAll('  ', '');
  }
}
