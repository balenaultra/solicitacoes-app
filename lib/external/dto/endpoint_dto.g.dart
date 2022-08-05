// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'endpoint_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EndPointDTO _$EndPointDTOFromJson(Map<String, dynamic> json) {
  return EndPointDTO(
    host: json['HOST'] as String?,
    port: json['PORT'] as String?,
  );
}

Map<String, dynamic> _$EndPointDTOToJson(EndPointDTO instance) =>
    <String, dynamic>{
      'HOST': instance.host,
      'PORT': instance.port,
    };
