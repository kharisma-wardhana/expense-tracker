import 'package:flutter/material.dart';
import 'package:tracker/shared/themes/themes.dart';

class GoalList extends StatelessWidget {
  const GoalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            color: AppColor.primaryDark.withOpacity(0.3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Text(
                    "Goals",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    child: Text("See all"),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: CircleAvatar(
                    backgroundColor: AppColor.secondary,
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: Text("GOALS 1"),
                      ),
                      Container(
                        child: Text("GOALS 1"),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Container(
                    child: Text("GOALS 1"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
