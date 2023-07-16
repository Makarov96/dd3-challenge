import 'package:dd3_main_dependencies/dd3_main_dependencies.dart';

enum STATUSOFDATA { init, failure, success, loading }

abstract class BaseStateNotifier<T> extends StateNotifier<T> {
  STATUSOFDATA statusofdata = STATUSOFDATA.init;
  BaseStateNotifier(super.state);
}
