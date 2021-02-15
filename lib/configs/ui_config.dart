import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void initUIConfig() {
  circular24 = 24.0.w;
  circular20 = 20.0.w;
  circular16 = 16.0.w;
  circular12 = 12.0.w;
  circular8 = 8.0.w;
//透明度
  opacity20 = 0.2.w;
  opacity40 = 0.4.w;
  opacity60 = 0.6.w;
  opacity80 = 0.8.w;
//间距
  padding10 = 10.w;
  padding20 = 20.w;
  padding30 = 30.w;
  padding40 = 40.w;
//模糊
  blurRadius2 = 2.0.w;
  blurRadius4 = 4.0.w;
  blurRadius6 = 6.0.w;
  blurRadius8 = 8.0.w;
  blurRadius10 = 10.0.w;
  blurRadius12 = 12.0.w;
//size
  size4 = 4.0.w;
  size8 = 8.0.w;
  size12 = 12.0.w;
  size16 = 16.0.w;
  size20 = 20.0.w;
  size24 = 24.0.w;
  size28 = 28.0.w;
  size32 = 32.0.w;
  size36 = 36.0.w;
  size40 = 40.0.w;
  size44 = 44.0.w;
  size48 = 48.0.w;
  size52 = 52.0.w;
  size56 = 56.0.w;
  size60 = 60.0.w;
  size64 = 64.0.w;
  size68 = 68.0.w;
  size72 = 72.0.w;
//海拔
  evevation2 = 2.0.w;
  evevation4 = 4.0.w;
  evevation6 = 6.0.w;
  evevation8 = 8.0.w;
}

//圆角
double circular24;
double circular20;
double circular16;
double circular12;
double circular8;
//透明;
double opacity20;
double opacity40;
double opacity60;
double opacity80;
//间;
double padding10;
double padding20;
double padding30;
double padding40;
//模;
double blurRadius2;
double blurRadius4;
double blurRadius6;
double blurRadius8;
double blurRadius10;
double blurRadius12;
//size
double size4;
double size8;
double size12;
double size16;
double size20;
double size24;
double size28;
double size32;
double size36;
double size40;
double size44;
double size48;
double size52;
double size56;
double size60;
double size64;
double size68;
double size72;
//海拔
double evevation2;
double evevation4;
double evevation6;
double evevation8;
//颜色
//主题
final ThemeData defaultThemeData =
    ThemeData(primaryColor: Colors.indigoAccent, shadowColor: Colors.grey);
//超链接
final TextStyle linkStyle =
    TextStyle(color: Colors.indigoAccent, decoration: TextDecoration.underline);
