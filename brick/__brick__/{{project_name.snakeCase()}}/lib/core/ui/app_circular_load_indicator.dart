import 'package:flutter/material.dart';

class AppCircularLoadIndicator extends StatelessWidget {
  const AppCircularLoadIndicator({Key? key, required this.size, this.color})
      : super(key: key);
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: 2,
      valueColor: AlwaysStoppedAnimation<Color>(
          color ?? Theme.of(context).colorScheme.primary),
    );
  }
}
