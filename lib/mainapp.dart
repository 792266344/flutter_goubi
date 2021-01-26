import 'package:flutter/material.dart';

import 'pages/accountpages/loginpage.dart';


class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '狗逼网-狗逼之家',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}