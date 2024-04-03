import 'package:Stacked/core/storage/register.hive.dart';
import 'package:Stacked/features/entry.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/app/app.locator.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Hive.initFlutter();
    registerHiveAdapters();
    await setupLocator();
  } catch (e) {
    debugPrint(e.toString());
  }
  runApp(const Todo());
}
