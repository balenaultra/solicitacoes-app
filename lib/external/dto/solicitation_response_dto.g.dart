// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solicitation_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SolicitationResponseDTO _$SolicitationResponseDTOFromJson(
    Map<String, dynamic> json) {
  return SolicitationResponseDTO(
    message: json['message'],
    solicitations: json['data'],
  );
}

Map<String, dynamic> _$SolicitationResponseDTOToJson(
        SolicitationResponseDTO instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.solicitations,
    };
