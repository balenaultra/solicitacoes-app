// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'default_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DefaultResponseDTO _$DefaultResponseDTOFromJson(Map<String, dynamic> json) {
  return DefaultResponseDTO(
    message: json['message'],
    data: json['data'],
    detail: json['detail'] as String?,
    query: json['query'] as String?,
    parameters: json['parameters'] as String?,
  );
}

Map<String, dynamic> _$DefaultResponseDTOToJson(DefaultResponseDTO instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'detail': instance.detail,
      'query': instance.query,
      'parameters': instance.parameters,
    };
