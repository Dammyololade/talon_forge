import 'package:{{project_name.snakeCase()}}/core/ui/form_field_container.dart';
import 'package:{{project_name.snakeCase()}}/core/ui/ui_kits.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function(String)? onSubmit;
  final TextInputType? textInputType;
  final Widget? trailing;
  final List<String>? autoFillHints;
  final maxLength;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? finalInputFormatters;
  final bool obscureText;
  final Widget? prefix;
  final String? initialValue;
  final VoidCallback? onTap;
  final int? minLines;
  final int? maxLines;

  const AppTextField({
    Key? key,
    this.label,
    this.validator,
    this.onChanged,
    this.onSubmit,
    this.textInputType,
    this.controller,
    this.maxLength,
    this.trailing,
    this.autoFillHints,
    this.textInputAction,
    this.hint,
    this.finalInputFormatters,
    this.obscureText = false,
    this.prefix,
    this.initialValue,
    this.onTap,
    this.maxLines,
    this.minLines,
  }) : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> with UIKits {
  final ValueNotifier<bool> emailVerifiedNotifier = ValueNotifier(false);

  final ValueNotifier<bool> passwordVisibilityNotifier = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return FormFieldContainer(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextFormField(
              controller: widget.controller,
              initialValue: widget.initialValue,
              onChanged: (value) {
                widget.onChanged?.call(value);
              },
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              onTap: widget.onTap,
              cursorHeight: 20,
              onFieldSubmitted: widget.onSubmit,
              autofillHints: widget.autoFillHints,
              decoration: InputDecoration(
                  labelText: widget.label,
                  hintText: widget.hint,
                  prefix: widget.prefix),
              minLines: widget.minLines,
              maxLines: widget.maxLines ?? 1,
              keyboardType: widget.textInputType,
              inputFormatters: widget.finalInputFormatters,
              obscureText: widget.obscureText,
              maxLength: widget.maxLength,
              validator: widget.validator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              textInputAction: widget.textInputAction,
            ),
          ),
          if (widget.trailing != null) widget.trailing!,
        ],
      ),
    );
  }
}
