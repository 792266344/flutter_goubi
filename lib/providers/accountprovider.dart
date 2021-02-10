import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:digou/configs/serviceurl.dart';
import 'package:digou/helpers/dioHelper.dart';
import 'package:digou/models/webmodels/response.dart';
import 'package:dio/dio.dart';
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

  void login(String name, String passWord) async {
    if (name.isEmpty) {
      BotToast.showText(text: '请输入账号~');
    } else if (passWord.isEmpty) {
      BotToast.showText(text: '请输入密码~');
    } else {
      _reverseIsLogining();
      Http.post(DiGouAccount.login,
          formData: {'userName': name, 'passWord': passWord}).then((data) {
        var res = CommonResponse.fromJson(data);
        if (res.isOk) {
          BotToast.showText(text: '登录成功~');
          Http.login(res.getString('token'), '');
          account = Account()
            ..id = ''
            ..name = name;
          navigatorKey.currentState
              .pushNamedAndRemoveUntil('/home', (route) => false);
        } else {
          BotToast.showText(text: res.message);
        }
      });
      _reverseIsLogining();
    }
  }
}
