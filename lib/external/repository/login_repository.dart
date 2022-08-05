import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../dto/login_request_dto.dart';
import '../dto/login_response_dto.dart';

part 'login_repository.g.dart';

@RestApi()
abstract class LoginRepository {
  factory LoginRepository(Dio dio, {String baseUrl}) = _LoginRepository;

  @POST("/auth/login")
  Future<LoginResponseDTO> authUser(@Body() LoginRequestDTO loginRequest);
}
