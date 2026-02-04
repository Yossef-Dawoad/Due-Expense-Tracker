import 'package:expancetracker/expanse_tracker_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/bindings/dependancy_injection.dart';
import 'core/utils/bloc_observers/simple_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDependencies();
  Bloc.observer = SimpleBlocObserver();
  runApp(const ExpanseTrackerApp());
}
