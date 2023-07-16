import 'dart:developer';

import 'package:dd3_main_dependencies/dd3_main_dependencies.dart';

sealed class CustomErrors with EquatableMixin implements Exception {
  const CustomErrors({
    this.message = '',
  });
  void error(String e);
  final String message;
  @override
  List<Object?> get props => [message];
}

class ServerException extends CustomErrors {
  const ServerException({required this.serverMessage});
  final String serverMessage;
  @override
  String get message => serverMessage;

  @override
  void error(String e) {
    log(e);
  }
}

class IntParseError extends CustomErrors {
  @override
  void error(e) {
    log(e);
  }
}

class StringParseError extends CustomErrors {
  @override
  void error(e) {
    log(e);
  }
}

class ListParseError extends CustomErrors {
  @override
  void error(e) {
    log(e);
  }
}

extension CustomErrorsExtension on CustomErrors {
  void printer() {
    switch (this) {
      case IntParseError _:
        error('Int Parse Error');
      case StringParseError _:
        error('String Parse Error');
      case ListParseError _:
        error('List Parse Error');
      case ServerException _:
        error('E Parse Error');
    }
  }
}
