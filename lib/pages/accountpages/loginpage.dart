import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goubi/configs/ui_config.dart';
import 'package:goubi/providers/accountprovider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  TextEditingController _unCtl = TextEditingController();
  TextEditingController _pwdCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _unInput = Selector<AccountProvider, bool>(
        selector: (o, n) => true,
        builder: (ctx, t, child) {
          return TextField(
            controller: _unCtl,
            decoration:
                InputDecoration(prefix: Icon(Icons.account_box)),
          );
        });
    final _pwdInput = Selector<AccountProvider, bool>(
        selector: (o, n) => true,
        builder: (ctx, t, child) {
          return TextField(
            controller: _pwdCtl,
          );
        });
    return ChangeNotifierProvider<AccountProvider>(
        create: (ctx) => AccountProvider(),
        builder: (ctx, child) => Scaffold(
              resizeToAvoidBottomPadding: false,
              body: Container(
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                        image: AssetImage('assets/login_background.png'),
                        fit: BoxFit.cover)),
                child: Container(
                    width: 350.r,
                    height: 300.r,
                    margin: EdgeInsets.only(top: 200),
                    padding: EdgeInsets.all(padding20),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(opacity60),
                        borderRadius: BorderRadius.circular(circular20)),
                    child: Column(
                      children: [
                        Text('立即登录狗逼网~',style: Theme.of(ctx).textTheme.headline5.copyWith(fontWeight:FontWeight.bold)),
                        _unInput, _pwdInput],
                    )),
              ),
            ));
  }
}
