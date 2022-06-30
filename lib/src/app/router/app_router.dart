import 'package:dro_health/src/models/models.dart';
import 'package:dro_health/src/ui/category/presentation/category_page.dart';
import 'package:dro_health/src/ui/home/presentation/home_screen/home_page.dart';
import 'package:dro_health/src/ui/medicine_detail/presentation/medicine_detail_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute(builder: (context) {
          return const HomePage();
        });
      case Routes.medicineDetail:
        final Medicine medicine = settings.arguments as Medicine;
        return MaterialPageRoute(
          builder: (context) => MedicinePage(medicine: medicine),
        );
      case Routes.categoryPage:
        return MaterialPageRoute(
          builder: (context) => const CategoryPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const SafeArea(
            child: Scaffold(
              body: Center(
                child: Text('Nothing to see here'),
              ),
            ),
          ),
        );
    }
  }
}

class Routes {
  static const String homePage = '/homePage';
  static const String categoryPage = '/category';
  static const String medicineDetail = '/medicineDetail';

  static const List<String> routes = [
    homePage,
    categoryPage,
    medicineDetail,
  ];
}
