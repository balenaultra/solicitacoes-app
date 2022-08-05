import 'package:json_annotation/json_annotation.dart';

import '../../entities/endpoint_entity.dart';

part 'endpoint_dto.g.dart';

@JsonSerializable()
class EndPointDTO extends EndPointEntity {
  @JsonKey(name: 'HOST')
  String? host;

  @JsonKey(name: 'PORT')
  String? port;

  EndPointDTO({this.host, this.port}) : super(host: host, port: port);

  factory EndPointDTO.fromJson(Map<String, dynamic> json) => _$EndPointDTOFromJson(json);
  Map<String, dynamic> toJson() => _$EndPointDTOToJson(this);
}
