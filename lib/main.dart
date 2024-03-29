import 'package:dro_health/src/app/app_barrel.dart';
import 'package:dro_health/src/ui/category/bloc/category_bloc.dart';
import 'package:dro_health/src/ui/home/bloc/home_bloc.dart';
import 'package:dro_health/src/utils/widget/app_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const PharmacyApp());
}

class PharmacyApp extends StatelessWidget {
  const PharmacyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (context) => UserBloc()..add(UserFetched()),
        ),
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(),
        ),
        BlocProvider<CategoryCubit>(
          create: (context) => CategoryCubit()..fetchCategories(),
        ),
      ],
      child: MainWrapper(
        child: MaterialApp(
          theme: AppTheme.lightTheme,
          themeMode: ThemeMode.light,
          initialRoute: Routes.homePage,
          onGenerateRoute: AppRouter.onGenerateRoute,
        ),
      ),
    );
  }
}
