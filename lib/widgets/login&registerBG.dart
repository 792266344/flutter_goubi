import 'package:digou/configs/ui_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrapezoidPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 60.w); //x,y坐标
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height - 60.w);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class LoginARegisterBG extends StatelessWidget {
  Widget child;
  LoginARegisterBG({@required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Theme.of(context).primaryColor,
      child: Stack(alignment: AlignmentDirectional.center, children: [
        Positioned(
            top: 120.w,
            left: 50.w,
            child: Text(
              '地狗地狗\n  什么都有！',
              style: TextStyle(
                  fontSize: size40,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'ZCOOL'),
            )),
        ClipPath(
            //路径剪裁组件
            clipper: TrapezoidPath(),
            child: Container(
              width: double.infinity,
              height: 240.w,
              color: Colors.white,
            )),
        child,
      ]),
    );
  }
}
