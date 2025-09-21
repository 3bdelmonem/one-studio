import 'package:one_studio_task/core/navigation/app_navigator.dart';
import 'package:one_studio_task/core/translation/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_studio_task/core/storage/data/storage.dart';
import 'package:one_studio_task/core/theme/app_theme.dart';
import 'package:one_studio_task/core/injection/injection_container.dart';
import 'package:one_studio_task/features/meals/presentation/cubit/meal_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_studio_task/features/meals/presentation/screens/meals_screen.dart.dart';


class MyApp extends StatefulWidget {
  const MyApp({super.key});
  static MyAppState? of(BuildContext context) => context.findAncestorStateOfType<MyAppState>();
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Locale _locale = Locale(sl<Storage>().getLang());
  void setLocale(Locale locale) {setState(() {_locale = locale;});}

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        scrollBehavior: const ScrollBehavior().copyWith(physics: const BouncingScrollPhysics()),
        theme: AppTheme.appTheme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: _locale,
        navigatorKey: sl<AppNavigator>().navigatorKey,
        home: BlocProvider<MealCubit>(
          create: (context) => sl<MealCubit>(),
          child: MealsScreen(),
        ),
      )
    );
  }
}