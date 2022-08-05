import 'package:solicitacoes_app/external/dto/login_request_dto.dart';

import '../middleware/dio_shared.dart';
import '../dto/login_response_dto.dart';
import '../error/error_api.dart';

class LoginApi {
  static Future<String> login(String username, String password) async {
    try {
      LoginResponseDTO result = await DioShared.login().authUser(LoginRequestDTO(username, password));

      if (result.access_token != null) {
        return result.access_token!;
      }

      return null!;
    } catch (e, s) {
      throw LoginException('ERRO LOGINAPI => $e', s);
    }
  }
}
