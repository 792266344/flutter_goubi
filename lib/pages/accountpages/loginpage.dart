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
    final _unInput = TextField(
      controller: _unCtl,
      decoration:
          InputDecoration(prefixIcon: Icon(Icons.account_circle_outlined)),
    );
    final _pwdInput = TextField(
      controller: _pwdCtl,
      decoration: InputDecoration(
          prefixIcon: Icon(IconData(0xe616, fontFamily: 'Male'))),
    );

    final _loginBtn = Selector<AccountProvider, bool>(
        selector: (ctx, pro) => pro.isLogining,
        builder: (ctx, isLogining, child) {
          return FLLoadingButton(
              child: Text('进入地狗'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(circular24)),
              color: Theme.of(ctx).primaryColor,
              disabledColor: Theme.of(ctx).primaryColor,
              indicatorColor: Colors.white,
              textColor: Colors.white,
              loading: isLogining,
              hoverElevation: evevation2,
              highlightElevation: evevation2,
              minWidth: 200.r,
              height: 45.r,
              indicatorOnly: true,
              onPressed: () =>
                  ctx.read<AccountProvider>().login(_unCtl.text, _pwdCtl.text));
        });
    return ChangeNotifierProvider<AccountProvider>(
        create: (ctx) => AccountProvider(),
        builder: (ctx, child) => Scaffold(
              resizeToAvoidBottomPadding: false,
              body: Container(
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(color: Colors.white),
                child: Container(
                    width: 350.r,
                    height: 310.r,
                    margin: EdgeInsets.only(top: 200),
                    padding: EdgeInsets.all(padding20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Theme.of(ctx)
                                  .shadowColor
                                  .withOpacity(opacity40),
                              blurRadius: blurRadius8,
                              spreadRadius: blurRadius4)
                        ],
                        borderRadius: BorderRadius.circular(circular20)),
                    child: Column(
                      children: [
                        Center(
                            child: Icon(IconData(0xe75f,fontFamily: 'Animals'),
                                color: Theme.of(ctx).primaryColor,size:size60)),
                        SizedBox(
                          height: 4.r,
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
