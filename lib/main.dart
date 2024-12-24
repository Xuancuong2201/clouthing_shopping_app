import 'package:ex/dependecy_injection/setup.dart';
import 'package:ex/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  configureDependency();
  runApp(
      ProviderScope(child: MyApp()),
  );
  }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.blue, // Màu nền của status bar
        statusBarIconBrightness: Brightness.light, // Màu icon: light = trắng
      ),
    );
    return MaterialApp.router(
      routerConfig: AppRouter().router,
      debugShowCheckedModeBanner: false,
    );
  }
}
