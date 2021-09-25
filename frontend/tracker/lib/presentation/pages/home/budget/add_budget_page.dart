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
  TextEditingController _amountController = TextEditingController();
  TextEditingController _descController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController();
    _descController = TextEditingController();
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                  ),
                ),
                const SizedBox(width: defaultSpacing),
                Text(
                  'Add Budget',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
            const Divider(),
            const SizedBox(height: defaultSpacing),
            const Text('Type'),
            Row(
              children: [
                GestureDetector(
                  onTap: () => setState(() => isExpending = false),
                  child: ChoiceChip(
                    label: Text('Income'),
                    selected: !isExpending,
                  ),
                ),
                const SizedBox(width: 18),
                GestureDetector(
                  onTap: () => setState(() => isExpending = true),
                  child: ChoiceChip(
                    label: Text('Expense'),
                    selected: isExpending,
                  ),
                ),
              ],
            ),
            const SizedBox(height: defaultSpacing),
            const Text('Category'),
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
            const SizedBox(height: defaultSpacing),
            CustomTextField(
              title: 'Amount',
              iconAsset: 'assets/image/splash.png',
              formField: TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration.collapsed(
                  hintText: 'Insert Price',
                  hintStyle: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
            const SizedBox(height: defaultSpacing),
            CustomTextField(
              title: 'Description',
              iconAsset: 'assets/image/splash.png',
              formField: TextFormField(
                controller: _descController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Insert Description',
                  hintStyle: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
            const SizedBox(height: defaultSpacing),
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
                    'Success Add Amount ${_amountController.text}',
                  );

                  setState(() {
                    _amountController.text = '';
                    _descController.text = '';
                    isExpending = false;
                    selectedCategory = 0;
                    isLoading = false;
                  });
                },
                child: Text('Add'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
