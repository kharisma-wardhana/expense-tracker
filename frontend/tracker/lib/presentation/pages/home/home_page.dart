import 'package:flutter/material.dart';
import 'package:tracker/common/style.dart';
import 'package:tracker/di/injector.dart';
import 'package:tracker/domain/router/router.dart';
import 'package:tracker/presentation/cubit/category/category_cubit.dart';
import 'package:tracker/presentation/pages/base_page.dart';
import 'package:tracker/presentation/pages/home/budget/budget_page.dart';
import 'package:tracker/presentation/pages/home/discover/discover_page.dart';
import 'package:tracker/presentation/pages/home/profile/profile_page.dart';
import 'package:tracker/presentation/pages/home/stats/stats_page.dart';
import 'package:tracker/utils/navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = new PageController(initialPage: 0);
  int _currentPage = 0;

  static const List<Widget> _contentBody = [
    DiscoverPage(),
    BudgetPage(),
    StatsPage(),
    ProfilePage(),
  ];

  static const List<String> _menuName = [
    "Discover",
    "Budget",
    "Stats",
    "Profile"
  ];

  static const List<IconData> _iconList = [
    Icons.dashboard,
    Icons.account_balance_wallet,
    Icons.assessment,
    Icons.account_circle,
  ];

  @override
  initState() {
    super.initState();
    _pageController = new PageController(initialPage: 0);
  }

  Widget _buildBottomNav() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: whiteColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          _menuName.length,
          (id) => _buildBottomIcon(id),
        ),
      ),
    );
  }

  Widget _buildBottomIcon(int id) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: _currentPage == id ? 32 : 0,
            height: 6,
            color: _currentPage == id ? darkSecondaryColor : greyColor,
          ),
          Container(
            height: 32,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _currentPage = id;
                });
                _pageController.jumpToPage(_currentPage);
              },
              child: Icon(
                _iconList[id],
                color: _currentPage == id ? darkSecondaryColor : secondaryColor,
              ),
            ),
          ),
          Text(
            _menuName[id],
            style: Theme.of(context).textTheme.caption?.copyWith(
                  color:
                      _currentPage == id ? darkSecondaryColor : secondaryColor,
                ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (val) async {
              setState(() {
                _currentPage = val;
              });
              if (val == 1) {
                await injector<CategoryCubit>().getCategoryExpense(
                  "Entertainment",
                );
              }
            },
            children: _contentBody,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildBottomNav(),
          ),
          Positioned(
            right: MediaQuery.of(context).size.width * 0.38,
            bottom: 40,
            child: GestureDetector(
              onTap: () {
                Navigation.intent(AddBudgetRoute);
              },
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: darkSecondaryColor,
                  borderRadius: BorderRadius.circular(80),
                ),
                child: Icon(
                  Icons.add_circle,
                  color: whiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
