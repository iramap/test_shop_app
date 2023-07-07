import 'package:flutter/material.dart';
import 'package:test_shop_app/screens/my_cart.dart';
import 'package:test_shop_app/screens/my_home.dart';
import 'package:test_shop_app/screens/my_profile.dart';

import '../manage/static_method.dart';

import '../values/colors.dart';

Widget bottomBarLayout(ctx, index, {b = false}) {
  return BottomNavigationBar(
    elevation: 50,
    backgroundColor: Clr().white,
    selectedItemColor: Clr().primaryColor,
    unselectedItemColor: Clr().grey,
    type: BottomNavigationBarType.fixed,
    currentIndex: index,
    onTap: (i) async {
      switch (i) {
        case 0:
          STM().replacePage(ctx, MyHome());
          break;
        // case 1:
        //   STM().replacePage(ctx, MyCart());
        //   break;
        case 1:
          STM().replacePage(ctx, MyProfile());
          break;
      }
    },
    items: STM().getBottomList(index, b),
  );
}
