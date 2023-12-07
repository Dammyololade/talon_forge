import 'package:{{project_name.snakeCase()}}/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_button.dart';

mixin OverlayKit {
  Future showPopup(
      {required BuildContext context,
      required String text,
      VoidCallback? onPop,
      PopupType type = PopupType.success,
      MainAxisAlignment mainAxisAlignment = MainAxisAlignment.end}) {
    var mounted = true;
    return showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) {
        popDialog() {
          mounted = false;
          if (onPop == null) {
            Navigator.pop(context);
          } else {
            onPop.call();
          }
        }

        var success = type == PopupType.success;
        return PopScope(
          canPop: onPop != null,
          onPopInvoked: (value) {
            mounted = false;
            if (onPop != null)  {
              onPop.call();
            }
          },
          child: Column(
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TweenAnimationBuilder<double>(
                builder: (context, value, child) => Transform.translate(
                    offset: Offset(0, value), child: child!),
                duration: const Duration(seconds: 4),
                tween: Tween(begin: 24, end: 0),
                curve: Curves.bounceOut,
                onEnd: () async =>
                    await Future.delayed(const Duration(seconds: 3), () {
                  if (mounted) popDialog();
                }),
                child: Padding(
                  padding: EdgeInsets.all(24.w),
                  child: Material(
                    borderRadius: BorderRadius.circular(4.w),
                    color: success
                        ? context.appColorScheme.success
                        : Colors.redAccent,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 18.w, vertical: 10.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            success
                                ? Icons.check_circle
                                : Icons.remove_circle_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Text(
                              text,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(width: 24.w),
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              onPressed: popDialog,
                              icon: Icon(Icons.close, size: 12.w),
                              padding: EdgeInsets.all(6.w),
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Future showPopupError(
          {required BuildContext context, required String text}) =>
      showPopup(context: context, text: text, type: PopupType.failure);

  showAppDialog(BuildContext context,
      {required String title,
      required String message,
      required VoidCallback onTapPositive}) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Container(
              padding: EdgeInsets.all((16).w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title,
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18.sp)),
                  SizedBox(height: 30.h),
                  Text(message),
                  SizedBox(height: 32.h),
                  SizedBox(
                    height: 55.h,
                    child: Row(
                      children: [
                        Expanded(
                          child: AppButton(
                              title: "No",
                              buttonType: AppButtonType.secondary,
                              onTap: () => Navigator.pop(context)),
                        ),
                        SizedBox(width: 20.w),
                        Expanded(
                          child: AppButton(
                            title: "Yes",
                            onTap: onTapPositive,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }



  showErrorDialog(
      {required BuildContext context,
      String title = "Error",
      required String message}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          AppButton(
            title: "Close ",
            onTap: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }


}

enum PopupType { success, failure }
