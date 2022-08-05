import 'package:json_annotation/json_annotation.dart';

part 'reply_response_dto.g.dart';

@JsonSerializable()
class ReplyResponseDTO {
  int? id;
  bool? authorized;

  @JsonKey(name: 'requested_description')
  String? requestedDescription;

  ReplyResponseDTO({this.id, this.authorized, this.requestedDescription});

  factory ReplyResponseDTO.fromJson(Map<String, dynamic> json) => _$ReplyResponseDTOFromJson(json);
  Map<String, dynamic> toJson() => _$ReplyResponseDTOToJson(this);
}
