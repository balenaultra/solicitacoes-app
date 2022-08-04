import 'package:solicitacoes_app/widgets/app_button.dart';
import 'package:solicitacoes_app/widgets/app_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import '../controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController _loginController = LoginController();
  LoginPage({Key? key, String? companyCPFCNPJ, String? username, String? password, bool? remember})
      : super(key: key) {
    if (companyCPFCNPJ != null && username != null && password != null && remember != null) {
      _loginController.initValues(companyCPFCNPJ, username, password, remember);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _loginController.formKey,
        child: Container(
          color: Theme.of(context).primaryColor,
          padding: EdgeInsets.all(16),
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                child: Image.asset(
                  'assets/images/UltraSistemas.png',
                  height: 90,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              AppText.cpfEndCnpj(
                controller: _loginController.companyCPFCNPJ,
                validator: _loginController.validateLogin,
                nextFocus: _loginController.focusCode,
              ),
              SizedBox(
                height: 10,
              ),
              AppText.code(
                controller: _loginController.username,
                validator: _loginController.validateLogin,
                focusNode: _loginController.focusCode,
                nextFocus: _loginController.focusPassword,
              ),
              SizedBox(
                height: 10,
              ),
              Observer(builder: (_) {
                return AppText.password(
                  controller: _loginController.password,
                  validator: _loginController.validateSenha,
                  focusNode: _loginController.focusPassword,
                  obscureText: _loginController.loginStore.hidePassword,
                  iconText: IconButton(
                    icon: const Icon(Icons.lock, color: Colors.white),
                    onPressed: () {
                      _loginController.loginStore.changeShowPassword();
                    },
                  ),
                );
              }),
              Observer(builder: (_) {
                return Theme(
                  data: ThemeData(unselectedWidgetColor: Colors.white),
                  child: CheckboxListTile(
                      title: Text(
                        "Lembrar?",
                        style: TextStyle(color: Colors.white),
                      ),
                      value: _loginController.loginStore.rememberMe,
                      onChanged: (value) => {_loginController.loginStore.changeRemember()},
                      controlAffinity: ListTileControlAffinity.leading),
                );
              }),
              Observer(
                builder: (_) {
                  bool showProgress = _loginController.loginStore.showProgress;

                  return AppButton.login(
                    onPressed: () => _loginController.onClickLogin(context),
                    showProgress: showProgress,
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextButton(
                    child: const Text(
                      "Configurações",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    onPressed: () => _loginController.showPageConfiguration(context)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
