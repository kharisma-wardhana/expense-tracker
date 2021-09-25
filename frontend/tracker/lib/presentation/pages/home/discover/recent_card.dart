import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tracker/common/style.dart';
import 'package:tracker/domain/entity/expense_entity.dart';

class RecentCard extends StatelessWidget {
  final ExpenseEntity expense;
  const RecentCard({Key? key, required this.expense}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
      ),
      shadowColor: primaryColor,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.only(
          left: defaultSpacing,
          right: defaultSpacing,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              width: 48,
              height: 48,
              child: Icon(
                Icons.account_balance_wallet,
                color: Colors.blue,
                size: 32,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${expense.name}',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      '${expense.category}',
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            color: darkSecondaryColor,
                          ),
                    ),
                    Text(
                      DateFormat('yyyy-MM-dd').format(expense.date),
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Text(
                '${expense.price}'.toCurrencies(),
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: Colors.purple,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
