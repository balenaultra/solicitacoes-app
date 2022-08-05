// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solicitation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SolicitationDTO _$SolicitationDTOFromJson(Map<String, dynamic> json) {
  return SolicitationDTO(
    id: json['ID'] as int?,
    operatorRequester: json['OPERADOR_SOLICITANTE'] as int?,
    nameRequested: json['NOME_SOLICITANTE'] as String?,
    operatorRequested: json['OPERADOR_SOLICITADO'] as int?,
    codRequester: json['CODSOLICITACAO'] as int?,
    dscTypeRequested: json['DSCTIPO_SOLICITACAO'] as String?,
    dscRequester: json['DSC_SOLICITANTE'] as String?,
    dscSolicitor: json['DSC_SOLICITADO'] as String?,
    detail: json['DETALHES'] as String?,
    dateSolicitation: json['DATA_SOLICITACAO'] as String?,
    dateAnswer: json['DATA_RESPOSTA'] as String?,
    authorization: json['AUTORIZADO'] as bool?,
  );
}

Map<String, dynamic> _$SolicitationDTOToJson(SolicitationDTO instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'OPERADOR_SOLICITANTE': instance.operatorRequester,
      'NOME_SOLICITANTE': instance.nameRequested,
      'OPERADOR_SOLICITADO': instance.operatorRequested,
      'CODSOLICITACAO': instance.codRequester,
      'DSCTIPO_SOLICITACAO': instance.dscTypeRequested,
      'DSC_SOLICITANTE': instance.dscRequester,
      'DSC_SOLICITADO': instance.dscSolicitor,
      'DETALHES': instance.detail,
      'DATA_SOLICITACAO': instance.dateSolicitation,
      'DATA_RESPOSTA': instance.dateAnswer,
      'AUTORIZADO': instance.authorization,
    };
