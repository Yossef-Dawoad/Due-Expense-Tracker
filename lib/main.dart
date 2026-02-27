import 'package:expancetracker/expanse_tracker_app.dart';
import 'package:flutter/material.dart';

import 'core/bindings/dependancy_injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDependencies();
  runApp(const ExpanseTrackerApp());
}
