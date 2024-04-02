import 'package:Stacked/features/entry.dart';
import 'package:flutter/material.dart';

import 'core/app/app.locator.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await setupLocator();
  } catch (e) {
    debugPrint(e.toString());
  }
  runApp(const Todo());
}
