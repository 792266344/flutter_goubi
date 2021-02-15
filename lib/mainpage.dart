import 'package:digou/providers/mainprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bottomNavigationBar = Selector<MainProvider, int>(
        selector: (ctx, pro) => pro.idx,
        builder: (ctx, idx, _) => BottomNavigationBar(
              currentIndex: idx,
              onTap: ctx.read<MainProvider>().setIdx,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Theme.of(context).primaryColor,
              iconSize: 20,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white54,
              showSelectedLabels: true,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(IconData(0xe76a, fontFamily: 'Animals')),label:'首页'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_bag_outlined), label: '分类'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.comment_outlined), label: '消息'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart_outlined), label: '购物车'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle_outlined), label: '我的'),
              ],
            ));

    return ChangeNotifierProvider<MainProvider>(
        create: (ctx) => MainProvider(),
        builder: (ctx, _) => Scaffold(
              body: ctx.watch<MainProvider>().page,
              bottomNavigationBar: _bottomNavigationBar,
            ));
  }
}
