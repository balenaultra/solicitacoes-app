import 'package:solicitacoes_app/models/login_model.dart';
import 'package:solicitacoes_app/utils/api_response.dart';
import 'package:solicitacoes_app/pages/home_page.dart';

//import 'package:solicitacoes_app/temporary/login_bloc.dart';
import 'package:solicitacoes_app/utils/alert.dart';
import 'package:solicitacoes_app/utils/nav.dart';
import 'package:solicitacoes_app/widgets/app_button.dart';
import 'package:solicitacoes_app/widgets/app_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _loginModal = LoginModel();

  final _tCompanyCPFCNPJ = TextEditingController(text: "04073237000153");
  final _tCode = TextEditingController(text: "2");
  final _tPassword = TextEditingController(text: "estac2ul");

  final _focusCode = FocusNode();
  final _focusPassword = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        color: Theme.of(context).colorScheme.primary,
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Container(
              child: Image.asset(
                'assets/images/UltraSistemas.png',
                height: 90,
              ),
            ),
            AppText(
              "CPF / CNPJ",
              "Digite o CPF / CNPJ da empresa",
              controller: _tCompanyCPFCNPJ,
              validator: _validateLogin,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              nextFocus: _focusCode,
            ),
            SizedBox(
              height: 10,
            ),
            AppText(
              "Código",
              "Digite o Código do Operador no Gestão",
              controller: _tCode,
              validator: _validateLogin,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              focusNode: _focusCode,
              nextFocus: _focusPassword,
            ),
            SizedBox(
              height: 10,
            ),
            AppText(
              "Senha",
              "Informe a Senha",
              password: true,
              controller: _tPassword,
              validator: _validateSenha,
              keyboardType: TextInputType.text,
              focusNode: _focusPassword,
            ),
            SizedBox(
              height: 20,
            ),
            Observer(
              builder: (_) {
                bool showProgress = _loginModal.showProgress;

                return AppButton(
                  "Login",
                  onPressed: _onClickLogin,
                  showProgress: showProgress,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  _onClickLogin() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    String companyCPFCNPJ = _tCompanyCPFCNPJ.text;
    String code = _tCode.text;
    String password = _tPassword.text;

    ApiResponse response =
        await _loginModal.login(companyCPFCNPJ, code, password);

    if (response.ok) {
      push(context, HomePage(), replace: true);
    } else {
      alert(context, response.msg);
    }
  }

  String _validateLogin(String text) {
    if (text.isEmpty) {
      return "Digite o Texto";
    }
    return null;
  }

  String _validateSenha(String text) {
    if (text.isEmpty) {
      return "Digite a Senha";
    }

    if (text.length < 3) {
      return "A senha deve ter ao menos 3 dígitos";
    }

    return null;
  }
}
