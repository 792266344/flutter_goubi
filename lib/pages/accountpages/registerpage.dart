import 'dart:convert';

import 'package:digou/configs/serviceurl.dart';
import 'package:digou/configs/ui_config.dart';
import 'package:digou/helpers/dioHelper.dart';
import 'package:digou/widgets/login&registerBG.dart';
import 'package:flui/flui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _unCtl = TextEditingController();
  TextEditingController _pwdCtl = TextEditingController();
  TextEditingController _pwd2Ctl = TextEditingController();
  FocusNode _unFN = FocusNode();
  FocusNode _pwdFN = FocusNode();
  FocusNode _pwd2FN = FocusNode();

  bool _isRepeatUN = false;

  bool _isRegistering = false;

  @override
  void initState() {
    _unFN.addListener(() {
      if (!_unFN.hasFocus) {
        print('查询昵称是否重复');
      }
    });
    _pwdFN.addListener(() {
      if (_pwdFN.hasFocus) {
        _pwd2Ctl.clear();
      }
    });
    _pwd2FN.addListener(() {
      if (!_isRepeatUN) {}
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final unInput = TextField(
      controller: _unCtl,
      focusNode: _unFN,
      decoration:
          InputDecoration(prefixIcon: Icon(Icons.account_circle_outlined)),
    );

    final pwdInput = TextField(
      controller: _pwdCtl,
      focusNode: _pwdFN,
      decoration: InputDecoration(prefixIcon: Icon(Icons.lock_outline_rounded)),
    );

    final pwd2Input = TextField(
        controller: _pwd2Ctl,
        focusNode: _pwd2FN,
        decoration:
            InputDecoration(prefixIcon: Icon(Icons.lock_outline_sharp)));

    final registerBtn = FLLoadingButton(
        child: Text('立即注册'),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(circular24)),
        color: Theme.of(context).primaryColor,
        disabledColor: Theme.of(context).primaryColor,
        indicatorColor: Colors.white,
        textColor: Colors.white,
        loading: _isRegistering,
        hoverElevation: evevation2,
        highlightElevation: evevation2,
        minWidth: 200.w,
        height: 45.w,
        indicatorOnly: true,
        onPressed: () {
          print(DiGouAccount.checkUserName);
          Http.post(DiGouAccount.checkUserName).then((res) {
            print(res);
          });
        });

    final tip = Text('使用以下方式注册');

    final _registerPannel = Container(
        width: 320.w,
        height: 420.w,
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
        child: Column(children: [
          Center(
              child: Icon(IconData(0xe76a, fontFamily: 'Animals'),
                  color: Theme.of(context).primaryColor, size: size60)),
          unInput,
          SizedBox(
            height: 10.w,
          ),
          pwdInput,
          SizedBox(
            height: 10.w,
          ),
          pwd2Input,
          SizedBox(
            height: 18.w,
          ),
          registerBtn,
          SizedBox(
            height: 18.w,
          ),
          tip
        ]));

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: LoginARegisterBG(
          title: '上地狗\n  就购了！', 
          titleTop: 80.w,
          child: Center(child: _registerPannel)),
    );
  }
}
