import 'package:flutter/foundation.dart';

class AppModel extends ChangeNotifier {
  // Authentication
  Future<String> _loginProcess() {
    return Future.delayed(const Duration(seconds: 3), () => 'success');
  }

  Future<bool> login() async {
    var ret = await _loginProcess();
    return ret == 'success';
  }
}
