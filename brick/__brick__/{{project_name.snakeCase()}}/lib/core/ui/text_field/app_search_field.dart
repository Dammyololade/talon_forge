import 'package:{{project_name.snakeCase()}}/core/ui/ui_kits.dart';
import 'package:{{project_name.snakeCase()}}/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSearchField extends StatelessWidget with UIKits {
  const AppSearchField({Key? key, this.searchController, this.onChanged})
      : super(key: key);
  final TextEditingController? searchController;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      decoration: BoxDecoration(
          color: context.appColorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
                color: context.appColorScheme.shadow,
                offset: const Offset(0, 4),
                blurRadius: 10,
                spreadRadius: -2)
          ]),
      child: TextField(
        style: TextStyle(fontSize: (16.sp)),
        controller: searchController,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: Center(
            child: SvgPicture.asset(
              'assets/svg/ic_search.svg',
              colorFilter: ColorFilter.mode(
                  context.appColorScheme.onSurface, BlendMode.srcIn),
              height: 20.h,
            ),
          ),
          prefixIconConstraints: BoxConstraints(maxWidth: 26.w),
          hintText: "Search",
          hintStyle:
              TextStyle(fontSize: 16.sp, color: context.appColorScheme.onSurface),
        ),
      ),
    );
  }
}
