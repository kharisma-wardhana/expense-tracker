import 'package:flutter/material.dart';
import 'package:tracker/common/style.dart';

class CardInfoExpense extends StatelessWidget {
  const CardInfoExpense({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: defaultPadding,
        horizontal: defaultPadding,
      ),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              'My Balance',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    color: whiteColor,
                  ),
            ),
          ),
          Container(
            child: Text(
              'Balance',
              style: Theme.of(context).textTheme.headline2?.copyWith(
                    color: whiteColor,
                  ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Spend',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: whiteColor,
                        ),
                  ),
                  Text(
                    '- Balance',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: whiteColor,
                        ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Profit',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: whiteColor,
                        ),
                  ),
                  Text(
                    '+ Balance',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: whiteColor,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
