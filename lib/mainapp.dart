import 'package:bot_toast/bot_toast.dart';
import 'package:digou/mainpage.dart';
import 'package:digou/pages/accountpages/registerpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:digou/providers/appprovider.dart';
import 'package:provider/provider.dart';

import 'pages/accountpages/loginpage.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MainApp extends StatelessWidget {
  final routes = {
    '/home': (_) => MainPage(),
    '/login': (_) => LoginPage(),
    '/register': (_) => RegisterPage()
  };

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(411.4, 853.4),
        allowFontScaling: false,
        child: ChangeNotifierProvider<AppProvider>(
            create: (ctx) => AppProvider(),
            builder: (ctx, child) => MaterialApp(
                  navigatorKey: navigatorKey,
                  title: '上地狗，就购了!',
                  routes: routes,
                  initialRoute: '/login',
                  builder: BotToastInit(),
                  navigatorObservers: [BotToastNavigatorObserver()],
                  theme: ctx.watch<AppProvider>().themeData,
                  themeMode: ctx.watch<AppProvider>().themeMode,
                  debugShowCheckedModeBanner: false,
                )));
  }
}
