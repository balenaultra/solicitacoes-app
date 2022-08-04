import 'package:json_annotation/json_annotation.dart';

part 'default_response_dto.g.dart';

@JsonSerializable()
class DefaultResponseDTO {
  dynamic message;
  dynamic data;
  String? detail;
  String? query;
  String? parameters;

  DefaultResponseDTO({this.message, this.data, this.detail, this.query, this.parameters});

  factory DefaultResponseDTO.fromJson(Map<String, dynamic> json) => _$DefaultResponseDTOFromJson(json);
  Map<String, dynamic> toJson() => _$DefaultResponseDTOToJson(this);
}
