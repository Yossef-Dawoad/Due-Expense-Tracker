import 'package:expancetracker/expanse_tracker_app.dart';
import 'package:flutter/material.dart';

import 'config/locator_config.dart';
import 'core/utils/locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  locator.registerMany(modules);
  runApp(const ExpanseTrackerApp());
}
