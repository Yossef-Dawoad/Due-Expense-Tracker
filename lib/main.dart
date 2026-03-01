import 'package:flutter/material.dart';

import 'config/locator_config.dart';
import 'core/utils/locator.dart';
import 'startup/startup_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  locator.registerMany(modules);
  runApp(const StartupView());
}
