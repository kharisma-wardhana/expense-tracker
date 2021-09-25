import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tracker/common/enums.dart';
import 'package:tracker/common/style.dart';
import 'package:tracker/di/injector.dart';
import 'package:tracker/domain/entity/expense_entity.dart';
import 'package:tracker/presentation/cubit/category/category_cubit.dart';
import 'package:tracker/presentation/pages/base_page.dart';
import 'package:tracker/presentation/pages/home/discover/shimmer_card.dart';
import 'package:tracker/utils/category_helper.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({Key? key}) : super(key: key);

  @override
  _BudgetPageState createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  int currCategoryId = 0;

  void _handleChangeCategory(CategoryItem cat) async {
    setState(() => currCategoryId = cat.index);
    await injector<CategoryCubit>().getCategoryExpense(
      getCategoryString(cat),
    );
  }

  Widget _buildCategoryList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          CategoryItem.values.length,
          (index) => InkWell(
            onTap: () => _handleChangeCategory(CategoryItem.values[index]),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: currCategoryId == index ? secondaryColor : primaryColor,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
                child: Text(
                  getCategoryString(CategoryItem.values[index]),
                  style: TextStyle(
                      color: currCategoryId == index
                          ? Colors.white
                          : secondaryColor),
                ),
              ),
            ),
          ),
        ).toList(),
      ),
    );
  }

  Widget _buildListExpense(List<ExpenseEntity> allExpense) {
    return ListView.builder(
      itemCount: allExpense.length,
      itemBuilder: (context, index) => _buildCardExpense(allExpense[index]),
    );
  }

  Widget _buildCardExpense(ExpenseEntity expenseData) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      shadowColor: primaryColor,
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 48,
              height: 48,
              child: Icon(
                Icons.account_balance_wallet,
                color: Colors.blue,
                size: 32,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    expenseData.name,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    expenseData.description ?? '',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    DateFormat('yyyy-MM-dd').format(expenseData.date),
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ),
            Container(
              child: Text(
                '${expenseData.price}'.toCurrencies(),
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: secondaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryExpense() {
    return Expanded(
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategoryHasData) {
            return _buildListExpense(state.allExpense);
          }
          if (state is CategoryNoData) {
            return Center(child: Text('Empty data'));
          }
          if (state is CategoryFailed) {
            return Center(child: Text(state.message));
          }
          return ListView.builder(
            itemCount: 5,
            itemBuilder: (context, _) => const ShimmerRecentCard(),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BasePage(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  child: Text(
                    'Budget',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text('Category'),
            const SizedBox(height: 10),
            _buildCategoryList(),
            const SizedBox(height: 10),
            _buildCategoryExpense()
          ],
        ),
      ),
    );
  }
}
