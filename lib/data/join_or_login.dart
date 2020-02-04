import 'package:flutter/foundation.dart';

class JoinOrLogin extends ChangeNotifier{
  bool _isJoin = false;

  bool get isJoin => _isJoin;
  void toggle() {
    _isJoin = !_isJoin;

    //* ChangeNotifierProvider를 통해서 위 줄의 데이터를 처리함 
    notifyListeners();
  }
}