import 'package:solicitacoes_app/utils/prefs.dart';
import 'dart:convert' as convert;

class Usuario {
  int id;
  String companyCPFCNPJ;
  int code;
  String email;
  String name;
  String password;
  String token;
  DateTime tokenDate;
  List<String> roles;

  Usuario(this.id, this.companyCPFCNPJ, this.code, this.name, this.email,
      this.token, this.tokenDate, this.roles);

  Usuario.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyCPFCNPJ = json['company_cpf_cnpj'];
    code = json["code"];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    token = json['token'];
    tokenDate = json['tokenDate'] != null ? DateTime.parse(json['tokenDate']) : null;
    roles = json['roles'] != null ? json['roles'].cast<String>() : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['company_cpf_cnpj'] = this.companyCPFCNPJ;
    data['code'] = this.code;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['token'] = this.token;
    data['tokenDate'] = this.tokenDate.toIso8601String();
    data['roles'] = this.roles;
    return data;
  }

  static void clear() {
    Prefs.setString("user.prefs", "");
  }

  void save() {
    Map map = toJson();

    String json = convert.json.encode(map);

    //print(json);

    Prefs.setString("user.prefs", json);
  }

  static Future<Usuario> get() async {
    String json = await Prefs.getString("user.prefs");

    if (json.isEmpty) return null;

    Map map = convert.json.decode(json);

    Usuario user = Usuario.fromJson(map);

    return user;
  }

  @override
  String toString() {
    return 'Usuario{id: $id, companyCPFCNPJ: $companyCPFCNPJ, code: $code, name: $name, email: $email, token: $token, tokenDate: $tokenDate, roles: $roles}';
  }
}
