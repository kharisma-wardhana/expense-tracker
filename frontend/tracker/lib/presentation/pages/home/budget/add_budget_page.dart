import 'package:flutter/material.dart';
import 'package:tracker/presentation/pages/base_page.dart';

class AddBudgetPage extends StatefulWidget {
  const AddBudgetPage({Key? key}) : super(key: key);

  @override
  _AddBudgetPageState createState() => _AddBudgetPageState();
}

class _AddBudgetPageState extends State<AddBudgetPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BasePage(
        isLoading: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Type"),
            Row(
              children: [
                Text("Income"),
                Text("Expense"),
              ],
            ),
            Text("Category"),
            Row(
              children: [
                Text("Category A"),
                Text("Category B"),
                Text("Category C"),
              ],
            ),
            Text("Amount"),
            Text("Amount"),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: null,
              child: Text("Add"),
            )
          ],
        ),
      ),
    );
  }
}
