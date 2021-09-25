import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tracker/app.dart';
import 'package:tracker/common/constants.dart';
import 'package:tracker/di/injector.dart' as serviceLocator;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await (serviceLocator.init());
  await dotenv.load(fileName: '.env');
  await Hive.initFlutter();
  await Hive.openBox(AppConstant.appTheme);
  runApp(App());
}
