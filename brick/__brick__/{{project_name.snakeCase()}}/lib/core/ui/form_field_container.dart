import 'package:{{project_name.snakeCase()}}/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormFieldContainer extends StatelessWidget {
  FormFieldContainer({Key? key, required this.child}) : super(key: key);
  final Widget child;
  final ValueNotifier<bool> hasFocus = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: hasFocus,
      builder: (context, value, child) {
        return Focus(
          onFocusChange: (focused) => hasFocus.value = focused,
          child: ValueListenableBuilder(
            valueListenable: hasFocus,
            builder: (context, hasFocus, child) => AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              constraints: BoxConstraints(
                minHeight: 64.h,
              ),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                      color: hasFocus
                          ? context.appColorScheme.outlineVariant
                          : context.appColorScheme.outline)),
              child: child,
            ),
            child: child,
          ),
        );
      }
    );
  }
}
