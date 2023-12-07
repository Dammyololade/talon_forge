import 'package:{{project_name.snakeCase()}}/core/ui/app_circular_load_indicator.dart';
import 'package:{{project_name.snakeCase()}}/core/ui/ui_kits.dart';
import 'package:{{project_name.snakeCase()}}/theme/app_theme.dart';
import 'package:{{project_name.snakeCase()}}/theme/cubit/theme_cubit.dart';
import 'package:{{project_name.snakeCase()}}/theme/cubit/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppButton extends StatelessWidget with UIKits {
  final String title;
  final VoidCallback? onTap;
  final AppButtonType buttonType;
  final bool loading;
  final String? icon;
  final TextDirection direction;
  final bool enabled;

  const AppButton(
      {Key? key,
      required this.title,
      this.onTap,
      this.buttonType = AppButtonType.primary,
      this.loading = false,
      this.icon,
      this.direction = TextDirection.ltr,
      this.enabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: loading,
      child: SizedBox(
        height: 58.h,
        child: ElevatedButton(
            onPressed: enabled ? onTap : null,
            style: ElevatedButton.styleFrom(
                backgroundColor: primary
                    ? null
                    : (isSecondary
                        ? context.appColorScheme.secondary
                        : context.appColorScheme.error.withOpacity(.5)),
                elevation:0),
            child: BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                var colorScheme = Theme.of(context).colorScheme;
                if (loading) {
                  return Center(
                    child: AppCircularLoadIndicator(
                      size: 30.h,
                      color: !primary ? colorScheme.primary : Colors.white,
                    ),
                  );
                }
                var contentColor = state is LightThemeState && !primary
                    ? colorScheme.primary
                    : Colors.white;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  textDirection: direction,
                  children: [
                    Text(title,
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: contentColor)),
                    if (icon != null) ...[
                      width(19.w),
                      SvgPicture.asset(
                        icon!,
                        height: 24.h,
                        colorFilter: ColorFilter.mode(contentColor, BlendMode.srcIn),
                      )
                    ]
                  ],
                );
              },
            )
      ),
    ));
  }

  bool get primary => buttonType == AppButtonType.primary;

  bool get isSecondary => buttonType == AppButtonType.secondary;
}

enum AppButtonType { primary, secondary, danger }
