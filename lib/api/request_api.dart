import 'dart:convert';

import 'package:solicitacoes_app/utils/api_response.dart';
import 'package:solicitacoes_app/datas/request_data.dart';
import 'package:solicitacoes_app/utils/http_helper.dart' as http;

class RequestApi {
  static Future<ApiResponse<List<Request>>> fetch() async {
    try {
      var url = 'http://localhost:3000/requests';

      var response = await http.get(url);

      //print('Response status: ${response.statusCode}');
      //print('Response body: ${response.body}');

      List mapResponse = json.decode(response.body);

      if (response.statusCode == 200) {

        List<Request> requestList =
        mapResponse.map<Request>((map) => Request.fromMap(map)).toList();

        return ApiResponse.ok(requestList);
      }
      return ApiResponse.error("Não foi possível obter as solicitações");
    } catch (error) {
      //print("Erro ao obter as solicitações $error");

      return ApiResponse.error("Não foi possível obter as solicitações.");
    }
  }

  static Future<ApiResponse<bool>> update(Request request) async {
    try {
      var url = 'http://localhost:3000/requests/${request.id}';

      final params = {
        "response": request.response,
        "response_message": request.responseMessage,
        "response_date": request.responseDate};

      String s = json.encode(params);

      var response = await http.put(url, body: s);

      //print('Response status: ${response.statusCode}');
      //print('Response body: ${response.body}');

      var mapResponse = json.decode(response.body);

      if (response.statusCode == 200) {

        return ApiResponse.ok(true);
      }
      return ApiResponse.error(mapResponse["message"]);
    } catch (error) {
      //print("Erro ao obter as solicitações $error");

      return ApiResponse.error("Não foi possível atualizar a solicitação.");
    }
  }
}
