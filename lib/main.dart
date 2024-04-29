import 'package:expancetracker/expanse_tracker_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/bindings/dependancy_injection.dart';
import 'core/utils/bloc_observers/simple_observer.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initializeDependencies();
  Bloc.observer = SimpleBlocObserver();
  runApp(const ExpanseTrackerApp());
}
