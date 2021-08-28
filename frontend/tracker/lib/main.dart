import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tracker/app.dart';
import 'package:tracker/di/injector.dart' as serviceLocator;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await (serviceLocator.init());
  runApp(App());
}
