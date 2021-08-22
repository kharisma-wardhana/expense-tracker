import 'package:flutter/material.dart';
import 'package:tracker/presentation/pages/base_page.dart';

class BudgetPage extends StatelessWidget {
  const BudgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BasePage(
        body: Container(
          padding: EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    child: Text(
                      "Budget",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 32,
              ),
              Text("Category"),
            ],
          ),
        ),
      ),
    );
  }
}
