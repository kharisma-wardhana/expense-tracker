import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracker/common/style.dart';
import 'package:tracker/di/injector.dart';
import 'package:tracker/presentation/cubit/auth/auth_cubit.dart';
import 'package:tracker/presentation/cubit/discover/discover_cubit.dart';
import 'package:tracker/presentation/pages/base_page.dart';
import 'package:tracker/presentation/pages/home/discover/card_info_expense.dart';
import 'package:tracker/presentation/pages/home/discover/recent_card.dart';
import 'package:tracker/presentation/pages/home/discover/shimmer_card.dart';

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
                  'Hello,',
                  style: Theme.of(context).textTheme.headline3?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
              Container(
                child: BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    return Text(
                      state is AuthSuccess ? state.user.username : 'Username',
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

  Widget _buildRecentHistory() {
    return Expanded(
      child: BlocBuilder<DiscoverCubit, DiscoverState>(
        builder: (context, state) {
          if (state is DiscoverFailed) {
            return Center(child: Text(state.message));
          } else if (state is DiscoverNoData) {
            return Center(child: Text('Empty data'));
          } else if (state is DiscoverHasData) {
            return ListView.builder(
              itemCount: 4,
              itemBuilder: (_, id) => RecentCard(expense: state.allExpense[id]),
            );
          }
          return ListView.builder(
            itemCount: 4,
            itemBuilder: (context, _) => const ShimmerRecentCard(),
          );
        },
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
            const SizedBox(height: defaultSpacing),
            const CardInfoExpense(),
            const SizedBox(height: defaultSpacing),
            Padding(
              padding: const EdgeInsets.all(defaultSpacing),
              child: Text(
                'Today',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            _buildRecentHistory(),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
