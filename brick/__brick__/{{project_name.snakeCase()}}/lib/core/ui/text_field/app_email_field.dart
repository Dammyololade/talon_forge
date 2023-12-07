import 'package:{{project_name.snakeCase()}}/core/ui/text_field/app_text_field.dart';
import 'package:{{project_name.snakeCase()}}/core/ui/ui_kits.dart';
import 'package:flutter/material.dart';

class AppEmailField extends StatelessWidget with UIKits {
  AppEmailField(
      {Key? key,
      this.controller,
      this.validator,
      this.onSubmit,
      this.onChange,
      this.initialValue,
      this.label})
      : super(key: key);
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onSubmit;
  final ValueChanged<String>? onChange;
  final String? label;
  final String? initialValue;
  final ValueNotifier<bool> emailVerifiedNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return AppTextField(
        controller: controller,
        validator: validator,
        initialValue: initialValue,
        label: label,
        autoFillHints: const [AutofillHints.email],
        textInputType: TextInputType.visiblePassword,
        onChanged: (value) {
          emailVerifiedNotifier.value = _isValidEmail(value);
          onChange?.call(value);
        },
        onSubmit: onSubmit,
        trailing: ValueListenableBuilder(
            valueListenable: emailVerifiedNotifier,
            builder: (ct, bool value, ch) => Visibility(
                visible: value,
                child: Icon(
                  Icons.check_circle,
                  color: colorScheme(context).primary,
                ))));
  }

  bool _isValidEmail(String email) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(email);
  }
}
