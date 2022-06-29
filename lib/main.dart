import 'package:dro_health/src/app/locator/app_locator.dart';
import 'package:dro_health/src/app/router/app_router.dart';
import 'package:dro_health/src/app/theme/app_theme.dart';
import 'package:dro_health/src/utils/widget/app_wrapper.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(const PharmacyApp());
}

class PharmacyApp extends StatelessWidget {
  const PharmacyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainWrapper(
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.light,
        initialRoute: Routes.homePage,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
