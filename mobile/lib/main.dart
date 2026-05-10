import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:mobile/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('vi')],
        fallbackLocale: const Locale('en'),
        startLocale: const Locale('en'), 
        assetLoader: const RootBundleAssetLoader(),
        path: 'assets/translations',
        child: const App(),
      ),
    ),
  );
}