import 'package:goubi/models/accountmodels/account.dart';
import 'package:flutter/material.dart';

class AccountProvider extends ChangeNotifier {
  Account account;

  void login(String name, String password) {
    if (name == 'dg' && password == 'dg') {
      account = Account()
        ..id = ''
        ..name = name;
      notifyListeners;
    }
  }
}
