import 'package:dro_health/src/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainWrapper extends StatelessWidget {
  final MaterialApp child;

  const MainWrapper({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle().copyWith(
        statusBarColor: AppColors.purple,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return MediaQuery(
      data: const MediaQueryData().copyWith(
        textScaleFactor: 1,
        devicePixelRatio: 1,
      ),
      child: child,
    );
  }
}
