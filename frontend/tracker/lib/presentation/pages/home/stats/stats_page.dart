import 'package:flutter/material.dart';
import 'package:tracker/common/constants.dart';
import 'package:tracker/common/style.dart';
import 'package:tracker/presentation/pages/base_page.dart';
import 'package:tracker/presentation/pages/home/stats/balance_info.dart';
import 'package:tracker/presentation/pages/home/stats/bottom_info.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  int _selectedMonth = 0;

  Widget _buildListMonth() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          AppConstant.monthName.length,
          (index) => Container(
            margin: const EdgeInsets.only(right: defaultSpacing),
            child: ChoiceChip(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              label: Text('${AppConstant.monthName[index]}'),
              selected: _selectedMonth == index,
              onSelected: (val) {
                setState(() => _selectedMonth = index);
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BasePage(
        body: ListView(
          children: [
            Text(
              'Stats',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: defaultSpacing),
            Container(
              height: 32,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  1,
                  (index) => ChoiceChip(
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                    label: Text('2021'),
                    selected: true,
                  ),
                ),
              ),
            ),
            const SizedBox(height: defaultSpacing),
            _buildListMonth(),
            const SizedBox(height: defaultSpacing),
            const BalanceInfo(),
            const SizedBox(height: defaultSpacing),
            const Expanded(child: BottomInfoStats()),
          ],
        ),
      ),
    );
  }
}
