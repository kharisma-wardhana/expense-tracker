import 'package:flutter/material.dart';
import 'package:tracker/common/style.dart';

class BottomInfoStats extends StatelessWidget {
  const BottomInfoStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.remove_circle,
                ),
                Text(
                  'Spend',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
            Text(
              'Balance',
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    color: darkSecondaryColor,
                  ),
            ),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.add_circle,
                ),
                Text(
                  'Income',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
            Text(
              'Balance',
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    color: darkSecondaryColor,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
