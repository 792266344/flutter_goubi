import 'package:digou/configs/ui_config.dart';
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
      _unFN.addListener((){
        if(!_unFN.hasFocus){
          print('查询昵称是否重复');
        }
      });
      _pwdFN.addListener((){
        if(_pwdFN.hasFocus){
          _pwd2Ctl.clear();
        }
      });
      _pwd2FN.addListener((){
        if(!_isRepeatUN){}
      });
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    final title = Container(
        width: double.infinity,
        child: Text(
          '上地狗，就购了！',
          style: TextStyle(
              fontSize: size40,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
              fontFamily: 'ZCOOL'),
        ));

    final unInput = TextField(
      controller: _unCtl,
      focusNode: _unFN,
      decoration:
          InputDecoration(prefixIcon: Icon(Icons.account_circle_outlined)),
    );

    final pwdInput = TextField(
      controller: _pwdCtl,
      focusNode: _pwdFN,
      decoration:
          InputDecoration(prefixIcon: Icon(Icons.lock_outline_rounded)),
    );

    final pwd2Input = TextField(
      controller: _pwd2Ctl,
      focusNode: _pwd2FN,
      decoration:
          InputDecoration(prefixIcon: Icon(Icons.lock_outline_sharp))
    );

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
        height: 45.w,
        indicatorOnly: true,
        onPressed: () {});
    
    final tip = Text('使用以下方式注册');

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(40.w),
        child: Column(children: [
          title,
          unInput,
          pwdInput,
          pwd2Input,
          SizedBox(
            height: 18.w,
          ),
          registerBtn,
          SizedBox(
            height: 18.w,
          ),
          tip
        ]),
      ),
    );
  }
}
