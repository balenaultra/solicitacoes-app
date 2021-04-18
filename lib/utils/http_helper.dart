import 'package:solicitacoes_app/datas/usuario_data.dart';
import 'package:http/http.dart' as http;

Future<http.Response> get(String url) async {
  final headers = await _headers();
  var response = await http.get(Uri.parse(url), headers: headers);
  return response;
}

Future<http.Response> post(String url, {body}) async {
  final headers = await _headers();
  var response = await http.post(Uri.parse(url), body: body, headers: headers);
  return response;
}

Future<http.Response> put(String url, {body}) async {
  final headers = await _headers();
  var response = await http.put(Uri.parse(url), body: body, headers: headers);
  return response;
}

Future<http.Response> delete(String url) async {
  final headers = await _headers();
  var response = await http.delete(Uri.parse(url), headers: headers);
  return response;
}

Future<Map<String, String>> _headers() async {
  Usuario? user = await Usuario.get();

  Map<String, String> headers = {
    "Content-Type": "application/json",
  };

  if (user != null) {
    headers = {
      "Content-Type": "application/json",
      "x-access-token": "${user.token}"
    };
  }

  return headers;
}
