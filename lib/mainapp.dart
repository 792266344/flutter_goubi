import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'pages/accountpages/loginpage.dart';

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(411.4, 853.4),
        allowFontScaling: false,
        child: MaterialApp(
          title: '狗逼网-狗逼之家',
          debugShowCheckedModeBanner: false,
          home: LoginPage(),
        ));
  }
}
