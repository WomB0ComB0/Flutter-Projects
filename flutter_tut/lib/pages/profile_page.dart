import 'package:flutter/material.dart';
import 'package:flutter_tut/core/constants.dart';
import 'package:flutter_tut/core/notifiers.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const Column(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('images/yeah.png'),
          ),
          SizedBox(height: kDouble20),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Flutter Mapp'),
          ),
          SizedBox(height: kDouble20),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('info@fluttermapp.com'),
          ),
          SizedBox(height: kDouble20),
          ListTile(
            leading: Icon(Icons.web),
            title: Text('FlutterMapp.com'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          isDarkNotifier.value = !isDarkNotifier.value;
        },
        child: ValueListenableBuilder(
          valueListenable: isDarkNotifier,
          builder: (context, isDark, child) {
            if (isDark) {
              return const Icon(Icons.light_mode);
            } else {
              return const Icon(Icons.dark_mode);
            }
          },
        ),
      ),
    );
  }
}
