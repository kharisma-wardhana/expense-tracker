import 'package:flutter/material.dart';
import 'package:tracker/shared/constants/size_constant.dart';
import 'package:tracker/shared/themes/themes.dart';
import 'package:tracker/ui/base_page.dart';
import 'package:tracker/ui/home/card_info.dart';
import 'package:tracker/ui/home/category_list.dart';
import 'package:tracker/ui/home/goal_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String routeName = "/home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      body: Container(
        color: AppColor.primaryDark,
        padding: EdgeInsets.all(Sizes.dimen_18),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Text(
                    "Welcome, username",
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundColor: AppColor.secondary,
                  ),
                ),
              ],
            ),
            CategoryList(),
            Container(
              margin: EdgeInsets.only(top: Sizes.dimen_32),
              child: CardInfo(),
            ),
            GoalList(),
          ],
        ),
      ),
    );
  }
}
