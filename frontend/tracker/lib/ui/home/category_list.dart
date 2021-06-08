import 'package:flutter/material.dart';
import 'package:tracker/shared/constants/size_constant.dart';
import 'package:tracker/shared/themes/themes.dart';
import 'package:tracker/shared/utils/screen_util.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.screenWidth,
      height: Sizes.dimen_110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(Sizes.dimen_8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Sizes.dimen_18),
              color: AppColor.secondary,
            ),
            width: Sizes.dimen_100,
            height: Sizes.dimen_100,
          );
        },
      ),
    );
  }
}
