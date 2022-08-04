class ConnectionShared {
  static final ConnectionShared _instance = new ConnectionShared._internal();
  String? _authToken;
  String? _urlBase = "http://187.86.54.241:3018";
  String _codeBase = "90";
  String? _port;
  String? _host;

  factory ConnectionShared() {
    return _instance;
  }

  ConnectionShared._internal();

  String? getToken() => _authToken;

  void setToken(String token) {
    _authToken = token;
  }

  String? getUrl() => '$_host:$_port';

  String? getUrlBase() => _urlBase;

  String getCodeBase() => _codeBase;

  String getPort() => _port ?? "";

  void setPort(String port) {
    _port = port;
  }

  String getHost() => _host ?? "";

  void setHost(String host) {
    _host = host;
  }
}
