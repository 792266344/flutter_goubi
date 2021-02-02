import 'package:flui/flui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:digou/configs/ui_config.dart';
import 'package:digou/providers/accountprovider.dart';
import 'package:digou/providers/appprovider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class LoginPage extends StatelessWidget {
  TextEditingController _unCtl = TextEditingController();
  TextEditingController _pwdCtl = TextEditingController();
  // final channel = IOWebSocketChannel.connect('ws://echo.websocket.org');

  @override
  Widget build(BuildContext context) {
    final _unInput = Selector<AccountProvider, bool>(
        selector: (o, n) => true,
        builder: (ctx, t, child) {
          return TextField(
            controller: _unCtl,
            decoration: InputDecoration(
              fillColor: Colors.grey[100],
              filled: true,
              prefixIcon: Icon(Icons.account_circle,
                  color: Colors.red, size: size24.r),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.r, horizontal: 20.r),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(circular12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(circular12),
              ),
            ),
          );
        });
    final _pwdInput = Selector<AccountProvider, bool>(
        selector: (o, n) => true,
        builder: (ctx, t, child) {
          return TextField(
            onSubmitted: (input) {
              // channel.sink.add(input);
            },
            controller: _pwdCtl,
            decoration: InputDecoration(
              fillColor: Colors.grey[100],
              filled: true,
              prefixIcon: Icon(Icons.lock, color: Colors.red, size: size24.r),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.r, horizontal: 20.r),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(circular12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(circular12),
              ),
            ),
          );
        });

    final _loginBtn = Selector<AccountProvider, bool>(
        selector: (ctx, pro) => pro.isLogining,
        builder: (ctx, isLogining, child) {
          return FLLoadingButton(
              child: Text('进入地狗'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(circular24)),
              color: Theme.of(ctx).buttonColor,
              disabledColor: Theme.of(ctx).buttonColor,
              indicatorColor: Colors.white,
              textColor: Colors.white,
              loading: isLogining,
              hoverElevation: evevation2,
              highlightElevation: evevation2,
              minWidth: 200.r,
              height: 45.r,
              indicatorOnly: true,
              onPressed: () =>
                  // ctx.read<AppProvider>().nextThemeMode());
                  ctx.read<AccountProvider>().login(_unCtl.text, _pwdCtl.text));
        });
    return ChangeNotifierProvider<AccountProvider>(
        create: (ctx) => AccountProvider(),
        builder: (ctx, child) => Scaffold(
              resizeToAvoidBottomPadding: false,
              body: Container(
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                    color: Colors.red[300]),
                child: Container(
                    width: 350.r,
                    height: 310.r,
                    margin: EdgeInsets.only(top: 200),
                    padding: EdgeInsets.all(padding20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.white.withOpacity(opacity40),
                              blurRadius: blurRadius8,
                              spreadRadius: blurRadius4)
                        ],
                        borderRadius: BorderRadius.circular(circular20)),
                    child: Column(
                      children: [
                        Text('请登录您的地狗账号~',
                            style: Theme.of(ctx)
                                .textTheme
                                .headline5
                                .copyWith(fontWeight: FontWeight.w500)),
                        SizedBox(
                          height: 18.r,
                        ),
                        _unInput,
                        SizedBox(
                          height: 18.r,
                        ),
                        _pwdInput,
                        SizedBox(
                          height: 18.r,
                        ),
                        _loginBtn,
                        SizedBox(
                          height: 16.r,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('立即注册', style: linkStyle),
                            Text('忘记密码?', style: linkStyle),
                          ],
                        )
                      ],
                    )),
              ),
            ));
  }
}
