import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracker/common/style.dart';
import 'package:tracker/di/injector.dart';
import 'package:tracker/domain/entity/expense_entity.dart';
import 'package:tracker/presentation/cubit/auth/auth_cubit.dart';
import 'package:tracker/presentation/cubit/discover/discover_cubit.dart';
import 'package:tracker/presentation/pages/base_page.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  Widget _buildHeader() {
    return Container(
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "Hello,",
                  style: Theme.of(context).textTheme.headline3?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
              Container(
                child: BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    return Text(
                      state is AuthSuccess ? state.user.username : "Username",
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCard() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 18),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "My Balance",
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    color: whiteColor,
                  ),
            ),
          ),
          Container(
            child: Text(
              "Balance",
              style: Theme.of(context).textTheme.headline2?.copyWith(
                    color: whiteColor,
                  ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Spend",
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: whiteColor,
                        ),
                  ),
                  Text(
                    "- Balance",
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: whiteColor,
                        ),
                  ),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Profit",
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: whiteColor,
                        ),
                  ),
                  Text(
                    "+ Balance",
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

  Widget _buildRecentHistory() {
    return Expanded(
      child: BlocBuilder<DiscoverCubit, DiscoverState>(
        builder: (context, state) {
          if (state is DiscoverFailed) {
            return Center(child: Text(state.message));
          } else if (state is DiscoverNoData) {
            return Center(child: Text("Empty data"));
          } else if (state is DiscoverHasData) {
            return ListView.builder(
              itemCount: state.allExpense.length,
              itemBuilder: (_, id) => _buildCardHistory(state.allExpense[id]),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildCardHistory(ExpenseEntity expense) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      shadowColor: primaryColor,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "${expense.name}",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Container(
                      child: Text(
                        "${expense.category}",
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              color: darkSecondaryColor,
                            ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "${expense.date}",
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Text(
                "${expense.price}".toCurrencies(),
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

  @override
  Widget build(BuildContext context) {
    injector<DiscoverCubit>().getAllExpense();
    return BasePage(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            SizedBox(height: 10),
            _buildCard(),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Today",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            _buildRecentHistory(),
          ],
        ),
      ),
    );
  }
}
