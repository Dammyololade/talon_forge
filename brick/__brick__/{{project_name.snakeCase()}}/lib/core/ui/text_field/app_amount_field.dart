import 'package:{{project_name.snakeCase()}}/core/ui/ui_kits.dart';
import 'package:{{project_name.snakeCase()}}/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_text_field.dart';

class AppAmountField extends StatelessWidget with UIKits {
  AppAmountField(
      {super.key,
      this.controller,
      this.validator,
      this.onSubmit,
      this.onChanged,
      this.label,
      this.initialValue,
      this.currencySymbol});

  final TextEditingController? controller;
  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onSubmit;
  final ValueChanged<String>? onChanged;
  final String? label;
  final String? currencySymbol;
  final ValueNotifier<bool> showPassword = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: showPassword,
        builder: (ct, value, child) => AppTextField(
            controller: controller,
            initialValue: initialValue,
            obscureText: value,
            validator: validator,
            label: label,
            autoFillHints: const [AutofillHints.password],
            finalInputFormatters: [FilteringTextInputFormatter.digitsOnly],
            textInputType: TextInputType.number,
            onChanged: (value) {
              var tryParseNum = double.tryParse(value);
              if (tryParseNum != null) {
                onChanged?.call("$tryParseNum");
              }
            },
            onSubmit: onSubmit,
            prefix: currencySymbol != null
                ? Padding(
                    padding: const EdgeInsets.only(right: 2),
                    child: Text(
                      currencySymbol!,
                      style:
                          TextStyle(color: context.appColorScheme.onBackground),
                    ),
                  )
                : const SizedBox.shrink()));
  }
}
