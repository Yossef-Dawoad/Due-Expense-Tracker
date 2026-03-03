import 'package:flutter/material.dart';

import 'startup/startup_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const StartupView());
}
