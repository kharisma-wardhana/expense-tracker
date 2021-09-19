import 'package:flutter/material.dart';
import 'package:tracker/common/style.dart';
import 'package:tracker/presentation/cubit/theme/theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkTheme = false;
  bool _isReminderActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
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
                  "Settings",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
            SwitchListTile(
              title: Text(
                "Dark Theme",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              value: _isDarkTheme,
              onChanged: (val) async {
                await context.read<ThemeCubit>().changeTheme(isDarkTheme: val);
                setState(() => _isDarkTheme = val);
              },
            ),
            SwitchListTile(
              title: Text(
                "Reminder",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              value: _isReminderActive,
              onChanged: (val) => setState(() => _isReminderActive = val),
            ),
          ],
        ),
      ),
    );
  }
}
