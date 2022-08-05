import 'package:dio/dio.dart';
import 'package:solicitacoes_app/external/middleware/connection_shared.dart';

import '../repository/config_repository.dart';
import '../repository/login_repository.dart';
import '../repository/solicitation_requests_repository.dart';

class DioShared {
  static ConnectionShared requestsShared = ConnectionShared();
  static Dio _buildDio() => Dio(BaseOptions(connectTimeout: 5 * 1000));

  static Dio dioByToken() {
    Dio dio = _buildDio();
    dio.options.headers["Authorization"] = "Bearer " + requestsShared.getToken()!;
    return dio;
  }

  static LoginRepository login() {
    return LoginRepository(_buildDio(), baseUrl: requestsShared.getUrl()!);
  }

  static ConfigRepository configHost() {
    return ConfigRepository(_buildDio(), baseUrl: requestsShared.getUrlBase()!);
  }

  static SolicitationRequestsRepository solicitationRequets() {
    return SolicitationRequestsRepository(dioByToken(), baseUrl: requestsShared.getUrl()!);
  }
}
