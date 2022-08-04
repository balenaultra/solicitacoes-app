// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequestDTO _$LoginRequestDTOFromJson(Map<String, dynamic> json) {
  return LoginRequestDTO(
    json['username'] as String?,
    json['password'] as String?,
  );
}

Map<String, dynamic> _$LoginRequestDTOToJson(LoginRequestDTO instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };
