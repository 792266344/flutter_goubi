import 'package:digou/homepage.dart';
import 'package:flui/flui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:digou/providers/appprovider.dart';
import 'package:provider/provider.dart';

import 'pages/accountpages/loginpage.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MainApp extends StatelessWidget {
  FLToastDefaults _toastDefaults =
      FLToastDefaults(position: FLToastPosition.top);

  final routes = {
    '/homepage': (_) => HomePage(),
    '/loginpage': (_) => LoginPage()
  };

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(411.4, 853.4),
        allowFontScaling: false,
        child: ChangeNotifierProvider<AppProvider>(
            create: (ctx) => AppProvider(),
            builder: (ctx, child) => FLToastProvider(
                defaults: _toastDefaults,
                child: MaterialApp(
                  navigatorKey: navigatorKey,
                  title: '上地狗，就购了!',
                  routes: routes,
                  initialRoute: '/loginpage',
                  theme: ctx.watch<AppProvider>().themeData,
                  themeMode: ctx.watch<AppProvider>().themeMode,
                  debugShowCheckedModeBanner: false,
                ))));
  }
}
