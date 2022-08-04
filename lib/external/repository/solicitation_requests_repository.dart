import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../dto/reply_response_dto.dart';
import '../dto/solicitation_response_dto.dart';

part 'solicitation_requests_repository.g.dart';

@RestApi()
abstract class SolicitationRequestsRepository {
  factory SolicitationRequestsRepository(Dio dio, {String baseUrl}) = _SolicitationRequestsRepository;

  @GET("/requests/operator?pending={pending}")
  Future<SolicitationResponseDTO> getSolicitationOperator(@Path("pending") bool pending);

  @PUT("/requests/reply")
  Future<SolicitationResponseDTO> putSolicitation(@Body() ReplyResponseDTO replyResponseDTO);
}
