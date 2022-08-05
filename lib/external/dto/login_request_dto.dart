import 'package:json_annotation/json_annotation.dart';

part 'login_request_dto.g.dart';

@JsonSerializable()
class LoginRequestDTO {
  String? username;

  String? password;

  LoginRequestDTO(this.username, this.password);

  factory LoginRequestDTO.fromJson(Map<String, dynamic> json) => _$LoginRequestDTOFromJson(json);
  Map<String, dynamic> toJson() => _$LoginRequestDTOToJson(this);
}
