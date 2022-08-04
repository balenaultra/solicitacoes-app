import 'package:json_annotation/json_annotation.dart';

part 'login_response_dto.g.dart';

@JsonSerializable()
class LoginResponseDTO {
  String? access_token;

  LoginResponseDTO(this.access_token);

  factory LoginResponseDTO.fromJson(Map<String, dynamic> json) => _$LoginResponseDTOFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseDTOToJson(this);
}
