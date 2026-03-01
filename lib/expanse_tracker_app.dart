import 'package:expancetracker/core/utils/locator.dart';
import 'package:expancetracker/core/utils/navigation/router_service.dart';
import 'package:flutter/material.dart';

import 'core/ui/app_theme.dart';

class ExpanseTrackerApp extends StatelessWidget {
  const ExpanseTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    final routerService = locator<RouterService>();
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.buildTheme(Brightness.light),
      themeMode: ThemeMode.system,
      routerConfig: routerService.goRouter,
    );
  }
}
