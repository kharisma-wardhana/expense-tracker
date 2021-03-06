import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracker/common/style.dart';
import 'package:tracker/domain/router/router.dart';
import 'package:tracker/presentation/cubit/cubit.dart';
import 'package:tracker/presentation/pages/base_page.dart';
import 'package:tracker/presentation/widgets/popup.dart';
import 'package:tracker/utils/navigation.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isSignOutLoading = false;

  @override
  void initState() {
    super.initState();
    _isSignOutLoading = false;
  }

  @override
  void dispose() {
    _isSignOutLoading = false;
    super.dispose();
  }

  void _handleSignOut() async {
    setState(() => _isSignOutLoading = true);
    await FirebaseAuth.instance
        .signOut()
        .then(
          (val) => Navigation.intentReplacement(SignInRoute),
        )
        .catchError(
          (err) => PopUpDialog.showErrorSnackbar(context, err.message),
        );
    setState(() => _isSignOutLoading = false);
  }

  Widget _buildHeader() {
    return Row(
      children: [
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            String _profilePictureURL =
                state is AuthSuccess ? state.user.imageURL : '';
            return GestureDetector(
              onTap: () {
                Navigation.intent(EditProfileRoute);
              },
              child: CircleAvatar(
                radius: 40,
                backgroundImage: _profilePictureURL.isEmpty
                    ? Image.asset('assets/image/splash.png').image
                    : NetworkImage(_profilePictureURL),
              ),
            );
          },
        ),
        SizedBox(width: defaultPadding),
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: BlocSelector<AuthCubit, AuthState, String>(
                      selector: (state) =>
                          (state is AuthSuccess) ? state.user.username : '',
                      builder: (context, username) {
                        return Text(
                          username.isEmpty ? 'Username' : username,
                          style: Theme.of(context).textTheme.headline6,
                        );
                      },
                    ),
                  ),
                ],
              ),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  if (state is AuthSuccess) {
                    return Row(
                      children: [
                        Text(
                          '${state.user.balanceAmount}'.toCurrencies(),
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        Text(
                          '${state.user.incomeAmount}'.toCurrencies(),
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        Text(
                          '${state.user.expenseAmount}'.toCurrencies(),
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ],
                    );
                  }
                  if (state is AuthFailed) {
                    return Text(state.message);
                  }
                  return Text('Empty');
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMenu() {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.logout),
          title: Text(
            'Sign Out',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          onTap: _handleSignOut,
        ),
        ListTile(
          leading: Icon(Icons.settings),
          onTap: () {
            Navigation.intent(SettingsRoute);
          },
          title: Text(
            'Settings',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        ListTile(
          leading: Icon(Icons.info),
          onTap: () {
            showAboutDialog(
              context: context,
              applicationVersion: 'versi beta',
            );
          },
          title: Text(
            'About',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BasePage(
        isLoading: _isSignOutLoading,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profile',
              style: Theme.of(context).textTheme.headline4,
            ),
            const Divider(),
            const SizedBox(height: defaultPadding),
            _buildHeader(),
            const Divider(),
            const SizedBox(height: defaultPadding),
            Expanded(
              child: _buildMenu(),
            ),
            const SizedBox(height: defaultPadding),
          ],
        ),
      ),
    );
  }
}
