import 'package:dd3_main_dependencies/dd3_main_dependencies.dart';
import 'package:flutter/material.dart';

class HomeListener {
  static void homeListener(previous, next, BuildContext context) {
    if (next.status == STATUSOFDATA.failure) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Hubo un error intenta refrescar la pantalla'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
