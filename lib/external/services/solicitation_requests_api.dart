import 'package:solicitacoes_app/external/middleware/dio_shared.dart';

import '../../../entities/solicitation_entity.dart';
import '../dto/reply_response_dto.dart';
import '../dto/solicitation_dto.dart';
import '../dto/solicitation_response_dto.dart';
import '../error/error_api.dart';

class SolicitationRequestApi {
  static Future<List<SolicitationEntity>> getSolicitationRequestOperator(bool pending) async {
    try {
      List<SolicitationEntity> list = List.empty(growable: true);

      SolicitationResponseDTO result = await DioShared.solicitationRequets().getSolicitationOperator(pending);
      if (result.message != null) {
        for (var i = 0; i < result.message!.length; i++) {
          list.add(SolicitationDTO.fromJson(result.message![i]));
        }
      }
      return list;
    } catch (e, s) {
      throw SolicitationException('ERRO SOLICITATIOM OPERATOR=> $e', s);
    }
  }

  static Future<bool> putSolicitation(int id, bool authorized, String requestedDescription) async {
    try {
      SolicitationResponseDTO result = await DioShared.solicitationRequets().putSolicitation(
          ReplyResponseDTO(id: id, authorized: authorized, requestedDescription: requestedDescription));
      if (result.message != null) {}
      return true;
    } catch (e, s) {
      throw SolicitationException('ERRO PUT SOLICITATION => $e', s);
    }
  }
}
