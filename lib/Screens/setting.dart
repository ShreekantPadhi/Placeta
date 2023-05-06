import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _enableNotifications = false;
  bool _enableDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/register.png'),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              'Settings',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Notifications',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 16.0),
                SwitchListTile(
                  title: Text(
                    'Enable Notifications',
                    style: TextStyle(color: Colors.white),
                  ),
                  value: _enableNotifications,
                  onChanged: (bool value) {
                    setState(() {
                      _enableNotifications = value;
                    });
                  },
                ),
                SizedBox(height: 16.0),
                Text(
                  'Appearance',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 16.0),
                SwitchListTile(
                  title: Text(
                    'Enable Dark Mode',
                    style: TextStyle(color: Colors.white),
                  ),
                  value: _enableDarkMode,
                  onChanged: (bool value) {
                    setState(() {
                      _enableDarkMode = value;
                      // ignore: unused_label
                      ThemeMode:
                      ThemeMode.dark;
                    });
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
