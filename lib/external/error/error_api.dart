abstract class ApiException {
  final String message;
  final StackTrace? stackTrace;

  const ApiException(this.message, [this.stackTrace]);
}

class LoginException extends ApiException {
  const LoginException(message, [stackTrace]) : super(message, stackTrace);
}

class ConfigHostException extends ApiException {
  const ConfigHostException(message, [stackTrace]) : super(message, stackTrace);
}

class SolicitationException extends ApiException {
  const SolicitationException(message, [stackTrace]) : super(message, stackTrace);
}
