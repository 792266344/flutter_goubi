import 'package:digou/mainapp.dart';
import 'package:digou/widgets/login&registerBG.dart';
import 'package:flui/flui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:digou/configs/ui_config.dart';
import 'package:digou/providers/accountprovider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class LoginPage extends StatelessWidget {
  TextEditingController _unCtl = TextEditingController();
  TextEditingController _pwdCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _unInput = TextField(
      controller: _unCtl,
      decoration:
          InputDecoration(prefixIcon: Icon(Icons.account_circle_outlined)),
    );
    final _pwdInput = TextField(
      controller: _pwdCtl,
      decoration: InputDecoration(prefixIcon: Icon(Icons.lock_outline_rounded)),
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
              minWidth: 200.w,
              height: 45.w,
              indicatorOnly: true,
              onPressed: () =>
                  // channel.sink.add('sds'));
                  ctx.read<AccountProvider>().login(_unCtl.text, _pwdCtl.text));
        });
    final _loginPannel = Container(
        width: 320.w,
        height: 320.w,
        padding: EdgeInsets.all(padding20),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).shadowColor.withOpacity(opacity40),
                  blurRadius: blurRadius8,
                  spreadRadius: blurRadius4)
            ],
            borderRadius: BorderRadius.circular(circular20)),
        child: Column(
          children: [
            Center(
                child: Icon(IconData(0xe76a, fontFamily: 'Animals'),
                    color: Theme.of(context).primaryColor, size: size60)),
            SizedBox(
              height: 4.w,
            ),
            _unInput,
            _pwdInput,
            SizedBox(
              height: 18.w,
            ),
            _loginBtn,
            SizedBox(
              height: 16.w,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  child: Text('立即注册', style: linkStyle),
                  onTap: () => navigatorKey.currentState.pushNamed('/register'),
                ),
                InkWell(
                  child: Text('忘记密码？', style: linkStyle),
                  onTap: () => FLToast.info(text: '暂未开放~'),
                ),
              ],
            )
          ],
        ));
    return ChangeNotifierProvider<AccountProvider>(
        create: (ctx) => AccountProvider(),
        builder: (ctx, child) => Scaffold(
            resizeToAvoidBottomPadding: false,
            body: LoginARegisterBG(
              child: Container(
                alignment: Alignment.center,
                child: _loginPannel,
              ),
            )));
  }
}
