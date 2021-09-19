import 'package:flutter/material.dart';
import 'package:tracker/common/enums.dart';
import 'package:tracker/common/style.dart';
import 'package:tracker/presentation/pages/base_page.dart';
import 'package:tracker/presentation/widgets/custom_text_field.dart';
import 'package:tracker/presentation/widgets/popup.dart';
import 'package:tracker/utils/category_helper.dart';

class AddBudgetPage extends StatefulWidget {
  const AddBudgetPage({Key? key}) : super(key: key);

  @override
  _AddBudgetPageState createState() => _AddBudgetPageState();
}

class _AddBudgetPageState extends State<AddBudgetPage> {
  bool isLoading = false;
  bool isExpending = false;
  int selectedCategory = 0;
  TextEditingController _amountController = new TextEditingController();
  TextEditingController _descController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _amountController = new TextEditingController();
    _descController = new TextEditingController();
  }

  @override
  void dispose() {
    _amountController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BasePage(
        isLoading: isLoading,
        appBar: AppBar(
          title: Text("Add Budget"),
          backgroundColor: secondaryColor,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Type"),
            Row(
              children: [
                GestureDetector(
                  onTap: () => setState(() => isExpending = false),
                  child: ChoiceChip(
                    label: Text("Income"),
                    selected: !isExpending,
                  ),
                ),
                const SizedBox(width: 18),
                GestureDetector(
                  onTap: () => setState(() => isExpending = true),
                  child: ChoiceChip(
                    label: Text("Expense"),
                    selected: isExpending,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text("Category"),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(
                CategoryItem.values.length,
                (index) => GestureDetector(
                  onTap: () => setState(() => selectedCategory = index),
                  child: ChoiceChip(
                    label: Text(getCategoryString(CategoryItem.values[index])),
                    selected: index == selectedCategory,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            CustomTextField(
              title: "Amount",
              formField: TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 8),
            CustomTextField(
              title: "Description",
              formField: TextFormField(
                controller: _descController,
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(120, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  setState(() => isLoading = true);
                  // TODO call add budget api
                  PopUpDialog.showInfoSnackbar(
                    context,
                    "Success Add Amount ${_amountController.text}",
                  );

                  setState(() {
                    _amountController.text = "";
                    isExpending = false;
                    selectedCategory = 0;
                    isLoading = false;
                  });
                },
                child: Text("Add"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
