import 'dart:io';

import 'package:flui/flui.dart';
import 'package:digou/models/accountmodels/account.dart';
import 'package:flutter/material.dart';
import '../mainapp.dart';

class AccountProvider extends ChangeNotifier {
  Account account;

  bool isLogining = false;

  void _reverseIsLogining() {
    this.isLogining = !this.isLogining;
    notifyListeners();
  }

  void login(String name, String password) async {
    if (name.isEmpty) {
      FLToast.info(text: '请输入账号~');
    } else if (password.isEmpty) {
      FLToast.info(text: '请输入密码~');
    } else {
      _reverseIsLogining();
      Future.delayed(Duration(seconds: 3)).then((res) {
        account = Account()
          ..id = ''
          ..name = name;
        FLToast.success(text: '登录成功');

        navigatorKey.currentState.pushNamed('/homepage');
        _reverseIsLogining();
      });
    }
  }
}
