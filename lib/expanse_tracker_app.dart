import 'package:expancetracker/core/routes/app_router.dart';
import 'package:expancetracker/core/routes/routes.dart';
import 'package:expancetracker/core/themes/theme.dart';
import 'package:expancetracker/features/home/views/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpanseTrackerApp extends StatelessWidget {
  const ExpanseTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AppRouter();
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.system,
        initialRoute: Routes.onBoarding,
        onGenerateRoute: router.onGenerateRoute,
        home: const NavigationMenu(),
      ),
    );
  }
}
