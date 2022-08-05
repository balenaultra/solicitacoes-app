import 'package:flutter_test/flutter_test.dart';
import 'package:solicitacoes_app/entities/endpoint_entity.dart';

import 'package:solicitacoes_app/external/middleware/connection_shared.dart';
import 'package:solicitacoes_app/external/services/config_host_api.dart';
import 'package:solicitacoes_app/external/services/login_api.dart';
import 'package:solicitacoes_app/external/services/solicitation_requests_api.dart';

void main() {
  test("teste", () async {
    EndPointEntity result = await ConfigHostApi.getConfigHostApi('04073237000153');
    print(result);
    expect(result.host, "http://177.107.120.137");
    expect(result.port, "3016");
  });

  test("Teste token", () async {
    String result = await LoginApi.login('1', 'estac2ul');
    print(result);
    expect(result, "");
  });

  test("Teste get solicitacao operator ", () async {
    final ConnectionShared requestsShared = ConnectionShared();

    EndPointEntity endPointEntity = await ConfigHostApi.getConfigHostApi('04073237000153');
    requestsShared.setHost(endPointEntity.host!);
    requestsShared.setPort(endPointEntity.port!);

    String resultLogin = await LoginApi.login('1', 'estac2ul');
    requestsShared.setToken(resultLogin);
    var r = await SolicitationRequestApi.getSolicitationRequestOperator(true);
    expect(r, true);
  });
}
