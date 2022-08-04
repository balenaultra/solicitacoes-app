import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppText extends StatelessWidget {
  final String label;
  final String hint;
  final bool password;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final List<TextInputFormatter>? inputFormatter;
  final Widget? icon;

  AppText(this.label, this.hint,
      {this.password = false,
      this.controller,
      this.validator,
      this.keyboardType,
      this.textInputAction,
      this.focusNode,
      this.nextFocus,
      this.inputFormatter,
      this.icon});

  factory AppText.cpfEndCnpj(
          {TextEditingController? controller, FormFieldValidator<String>? validator, FocusNode? nextFocus}) =>
      AppText(
        "CPF / CNPJ",
        "Digite o CPF / CNPJ da empresa",
        controller: controller,
        validator: validator,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        nextFocus: nextFocus,
        inputFormatter: [FilteringTextInputFormatter.digitsOnly, CpfOuCnpjFormatter()],
      );

  factory AppText.code(
          {TextEditingController? controller,
          FormFieldValidator<String>? validator,
          FocusNode? focusNode,
          FocusNode? nextFocus}) =>
      AppText(
        "Código",
        "Digite o Código do Operador no Gestão",
        controller: controller,
        validator: validator,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        focusNode: focusNode,
        nextFocus: nextFocus,
      );

  factory AppText.password(
          {TextEditingController? controller,
          FormFieldValidator<String>? validator,
          FocusNode? focusNode,
          Widget? iconText,
          bool? obscureText}) =>
      AppText("Senha", "Informe a Senha",
          password: obscureText!,
          controller: controller,
          validator: validator,
          keyboardType: TextInputType.text,
          focusNode: focusNode,
          icon: iconText);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      inputFormatters: inputFormatter,
      focusNode: focusNode,
      onFieldSubmitted: (String text) {
        if (nextFocus != null) FocusScope.of(context).requestFocus(nextFocus);
      },
      cursorColor: Theme.of(context).selectedRowColor,
      style: TextStyle(
        fontSize: 20,
        color: Theme.of(context).selectedRowColor,
      ),
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).selectedRowColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).selectedRowColor),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).selectedRowColor),
        ),
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 25,
          color: Theme.of(context).selectedRowColor,
        ),
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 16,
          color: Theme.of(context).selectedRowColor,
        ),
        suffixIcon: icon,
      ),
    );
  }
}
