import 'dart:developer';

import '../../../entities/endpoint_entity.dart';
import '../middleware/dio_shared.dart';
import '../middleware/connection_shared.dart';
import '../dto/default_response_dto.dart';
import '../error/error_api.dart';

class ConfigHostApi {
  static Future<EndPointEntity> getConfigHostApi(String companyCPFCNPJ) async {
    try {
      ConnectionShared requestsShared = ConnectionShared();
      DefaultResponseDTO defaultResponseDTO =
          await DioShared.configHost().getConfigHost(companyCPFCNPJ, requestsShared.getCodeBase());

      if (defaultResponseDTO.message != null) {
        Map map = defaultResponseDTO.message;
        if (map['status'] != "ERROR") {
          var data = map['data'];
          try {
            var host = data[0];
            EndPointEntity endPointEntity = EndPointEntity();
            endPointEntity.host = host['HOST'];
            endPointEntity.port = host['PORT'];
            return endPointEntity;
          } catch (e, s) {
            log('Não encontrado host e port $e $s');
            throw LoginException('Não encontrado host e porta');
          }
        } else {
          throw LoginException('Erro interno');
        }
      }

      return EndPointEntity();
    } catch (e, s) {
      throw LoginException('ERRO CONFIGHOST_API => $e', s);
    }
  }
}
