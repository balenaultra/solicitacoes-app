import 'dart:async';

import 'package:solicitacoes_app/datas/usuario_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StreamApi {
  static http.Client? _client;

  static bool subscribed = false;

  static subscribe(String eventName, Function onEvent) async {
    print("Subscribing..");
    try {
      var user = await Usuario.get();

      String url = "http://localhost:3000/stream/${user?.companyCPFCNPJ}";

      _client = http.Client();

      var request = new http.Request("GET", Uri.parse(url));
      request.headers["Cache-Control"] = "no-cache";
      request.headers["Accept"] = "text/event-stream";

      Future<http.StreamedResponse> response = _client!.send(request);

      response.asStream().listen((streamedResponse) {
        //print("Received streamedResponse.statusCode:${streamedResponse.statusCode}");

        subscribed = true;

        streamedResponse.stream.listen((data) {
          String response = utf8.decode(data);

          //print("Received data:$response");

          Map<String, dynamic> responseMap = json.decode(response);

          if (responseMap["event"] == eventName)
            onEvent();
        }, onError: (error) {
          print("onError $error");
        });
      });
    } catch (e) {
      print("Caught $e");
    }
  }

  static unsubscribe() {
    print("UN-Subscribing..");
    print(_client);
    if (_client != null)
      _client!.close();
  }
}