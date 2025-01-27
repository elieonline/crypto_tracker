import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';
import 'core/services/local_database/hive_keys.dart';
import 'features/dashboard/data/asset_model.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /*<====== HIVE =========>*/
  await Hive.initFlutter();
  Hive.registerAdapter(AssetAdapter());
  await Hive.openBox(HiveKeys.appBox);
  await Hive.openBox<Asset>(HiveKeys.assetBox);

  HttpOverrides.global = MyHttpOverrides();

  runApp(const ProviderScope(child: MyApp()));
}
