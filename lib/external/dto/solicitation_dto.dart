import 'package:json_annotation/json_annotation.dart';

import '../../entities/solicitation_entity.dart';

part 'solicitation_dto.g.dart';

@JsonSerializable()
class SolicitationDTO extends SolicitationEntity {
  @JsonKey(name: 'ID')
  int? id;

  @JsonKey(name: 'OPERADOR_SOLICITANTE')
  int? operatorRequester;

  @JsonKey(name: 'NOME_SOLICITANTE')
  String? nameRequested;

  @JsonKey(name: 'OPERADOR_SOLICITADO')
  int? operatorRequested;

  @JsonKey(name: 'CODSOLICITACAO')
  int? codRequester;

  @JsonKey(name: 'DSCTIPO_SOLICITACAO')
  String? dscTypeRequested;

  @JsonKey(name: 'DSC_SOLICITANTE')
  String? dscRequester;

  @JsonKey(name: 'DSC_SOLICITADO')
  String? dscSolicitor;

  @JsonKey(name: 'DETALHES')
  String? detail;

  @JsonKey(name: 'DATA_SOLICITACAO')
  String? dateSolicitation;

  @JsonKey(name: 'DATA_RESPOSTA')
  String? dateAnswer;

  @JsonKey(name: 'AUTORIZADO')
  bool? authorization;

  SolicitationDTO({
    this.id,
    this.operatorRequester,
    this.nameRequested,
    this.operatorRequested,
    this.codRequester,
    this.dscTypeRequested,
    this.dscRequester,
    this.dscSolicitor,
    this.detail,
    this.dateSolicitation,
    this.dateAnswer,
    this.authorization,
  }) : super(
          id: id,
          authorization: authorization,
          codRequester: codRequester,
          dateAnswer: dateAnswer,
          dateSolicitation: dateSolicitation,
          detail: detail,
          dscRequester: dscRequester,
          dscSolicitor: dscSolicitor,
          dscTypeRequested: dscTypeRequested,
          nameRequested: nameRequested,
          operatorRequested: operatorRequested,
        );

  factory SolicitationDTO.fromJson(Map<String, dynamic> json) => _$SolicitationDTOFromJson(json);
  Map<String, dynamic> toJson() => _$SolicitationDTOToJson(this);
}
