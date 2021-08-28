import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracker/common/style.dart';
import 'package:tracker/domain/router/router.dart';
import 'package:tracker/presentation/cubit/auth/auth_cubit.dart';
import 'package:tracker/presentation/pages/base_page.dart';
import 'package:tracker/utils/navigation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isDarkTheme = false;
  bool _isReminderActive = false;
  bool _isSignOutLoading = false;
  User? _currentUser = FirebaseAuth.instance.currentUser;
  String _profilePictureURL = "";
  CollectionReference _collectionUser =
      FirebaseFirestore.instance.collection('users');

  @override
  void initState() {
    super.initState();
    _currentUser = FirebaseAuth.instance.currentUser;
    _profilePictureURL = _currentUser?.photoURL ?? "";
    // final userDatae = _collectionUser.doc(_currentUser?.uid).get();
    // print(userDatae);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BasePage(
        isLoading: _isSignOutLoading,
        body: Container(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Profile",
                style: Theme.of(context).textTheme.headline4,
              ),
              Divider(),
              SizedBox(height: defaultPadding),
              Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: _profilePictureURL.isEmpty
                        ? Image.asset("assets/image/splash.png").image
                        : NetworkImage(
                            _profilePictureURL,
                          ),
                  ),
                  SizedBox(width: defaultPadding),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: BlocBuilder<AuthCubit, AuthState>(
                                builder: (context, state) {
                                  return Text(
                                    state is AuthSuccess
                                        ? state.user.username
                                        : "Username",
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            StreamBuilder<DocumentSnapshot>(
                              stream: _collectionUser
                                  .doc(_currentUser?.uid)
                                  .snapshots(),
                              builder: (
                                BuildContext context,
                                AsyncSnapshot<DocumentSnapshot> snapshot,
                              ) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  Map<String, dynamic> userData = snapshot.data
                                      ?.data() as Map<String, dynamic>;
                                  print("CHekeckekek UserData : $userData");
                                  return Text("${userData["balance"]}");
                                }
                                return Container();
                              },
                            ),
                            // FutureBuilder<DocumentSnapshot>(
                            //     future: _collectionUser
                            //         .doc(_currentUser?.uid)
                            //         .get(),
                            //     builder: (
                            //       BuildContext context,
                            //       AsyncSnapshot<DocumentSnapshot> snapshot,
                            //     ) {
                            //       Map<String, dynamic> data = snapshot.data!
                            //           .data() as Map<String, dynamic>;
                            //       return Text(
                            //         "${data["balance"]}",
                            //         style:
                            //             Theme.of(context).textTheme.subtitle2,
                            //       );
                            //     }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: defaultPadding),
              Divider(),
              SizedBox(height: defaultPadding),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text(
                  "Sign Out",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                onTap: () async {
                  setState(() {
                    _isSignOutLoading = true;
                  });
                  await FirebaseAuth.instance
                      .signOut()
                      .then((val) => Navigation.intentReplacement(SignInRoute))
                      .catchError((err) => print(err.message));
                  setState(() {
                    _isSignOutLoading = false;
                  });
                },
              ),
              ListTile(
                leading: Icon(Icons.info),
                onTap: () {
                  showAboutDialog(
                    context: context,
                    applicationVersion: "versi beta",
                  );
                },
                title: Text(
                  "About",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              Text(
                "Settings",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SwitchListTile(
                title: Text(
                  "Dark Theme",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                value: _isDarkTheme,
                onChanged: (val) {
                  setState(() {
                    _isDarkTheme = val;
                  });
                },
              ),
              SwitchListTile(
                title: Text(
                  "Reminder",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                value: _isReminderActive,
                onChanged: (val) {
                  setState(() {
                    _isReminderActive = val;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
