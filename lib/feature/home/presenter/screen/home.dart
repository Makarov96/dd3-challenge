import 'package:dd360_challenge/di_container.dart';
import 'package:dd360_challenge/feature/home/presenter/screen/widget/layout/layout_screen.dart';
import 'package:dd3_main_dependencies/dd3_main_dependencies.dart';
import 'package:flutter/material.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Switch(
            value: ref.watch(themeHandler),
            onChanged: (value) => ref.read(themeHandler.notifier).state = value,
          )
        ],
      ),
      body: const LayoutHomeScreen(),
    );
  }
}
