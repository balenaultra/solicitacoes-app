// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reply_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReplyResponseDTO _$ReplyResponseDTOFromJson(Map<String, dynamic> json) {
  return ReplyResponseDTO(
    id: json['id'] as int?,
    authorized: json['authorized'] as bool?,
    requestedDescription: json['requested_description'] as String?,
  );
}

Map<String, dynamic> _$ReplyResponseDTOToJson(ReplyResponseDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'authorized': instance.authorized,
      'requested_description': instance.requestedDescription,
    };
