import 'package:digou/configs/ui_config.dart';
import 'package:digou/providers/homeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeProvider>(
        create: (ctx) => HomeProvider(),
        builder: (ctx, _) => Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(
                        Icons.search,
                        size: size28,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(circular24),
                      ),
                      contentPadding: EdgeInsets.all(10))),
            ),
            body: SingleChildScrollView(
                child: Column(
              children: [
                Container(
                  height: 231.w,
                  margin: EdgeInsets.only(top: 10.w),
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return Image.network(
                        "http://via.placeholder.com/350x150",
                        fit: BoxFit.fill,
                      );
                    },
                    itemCount: 3,
                    viewportFraction: 0.8,
                    scale: 0.9,
                    pagination: new SwiperPagination(),
                    control: new SwiperControl(),
                  ),
                )
              ],
            ))));
  }
}
