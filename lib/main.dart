import 'package:dro_health/src/app/locator/app_locator.dart';
import 'package:dro_health/src/app/router/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(const PharmacyApp());
}

class PharmacyApp extends StatelessWidget {
  const PharmacyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: Routes.homePage,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
