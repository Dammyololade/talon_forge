import 'package:{{project_name.snakeCase()}}/core/ui/inkless_well.dart';
import 'package:{{project_name.snakeCase()}}/core/ui/text_field/app_text_field.dart';
import 'package:{{project_name.snakeCase()}}/core/ui/ui_kits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppPasswordField extends StatelessWidget with UIKits {
  AppPasswordField(
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
  final ValueNotifier<bool> hidePassword = ValueNotifier(true);
  final ValueNotifier<String> textChangeNotifier = ValueNotifier("");

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: hidePassword,
      builder: (context, val, _) {
        return AppTextField(
            controller: controller,
            obscureText: hidePassword.value,
            validator: validator,
            initialValue: initialValue,
            label: label,
            autoFillHints: const [AutofillHints.password],
            textInputType: TextInputType.visiblePassword,
            onChanged: (value) {
              onChange?.call(value);
            },
            onSubmit: onSubmit,
            trailing: InklessWell(
              onTap: () {
                hidePassword.value = !hidePassword.value;
              },
              child: Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Icon(
                  hidePassword.value
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  size: 20.h,
                ),
              ),
            ));
      }
    );
  }
}
