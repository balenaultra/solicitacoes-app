import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../dto/default_response_dto.dart';

part 'config_repository.g.dart';

@RestApi()
abstract class ConfigRepository {
  factory ConfigRepository(Dio dio, {String baseUrl}) = _ConfigRepository;

  @GET("/user/host?document={companyCPFCNPJ}&applicationCode={code}")
  Future<DefaultResponseDTO> getConfigHost(
      @Path("companyCPFCNPJ") String companyCPFCNPJ, @Path("code") String code);
}
