import 'package:json_annotation/json_annotation.dart';

part 'solicitation_response_dto.g.dart';

@JsonSerializable()
class SolicitationResponseDTO {
  dynamic message;

  @JsonKey(name: 'data')
  dynamic solicitations;

  SolicitationResponseDTO({this.message, this.solicitations});

  factory SolicitationResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$SolicitationResponseDTOFromJson(json);
  Map<String, dynamic> toJson() => _$SolicitationResponseDTOToJson(this);
}
