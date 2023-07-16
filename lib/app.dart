import 'package:dd360_challenge/core/router/router.dart';
import 'package:dd360_challenge/di_container.dart';
import 'package:dd3_main_dependencies/dd3_main_dependencies.dart';
import 'package:flutter/material.dart';

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return MaterialApp.router(
      routerConfig: router,
      theme: ref.watch(themeHandler) ? ThemeData.dark() : ThemeData.light(),
    );
  }
}
