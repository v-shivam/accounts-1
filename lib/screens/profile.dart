import 'package:accounts/components/buttons.dart';
import 'package:accounts/main.dart';
import 'package:accounts/screens/login_screen.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF6E5),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 100, 20, 40),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CircleAvatar(
                    radius: 65.0,
                  ),
                ),
                Expanded(
                  child: Text("Username: \nVishnu P V",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0, 0.0),
              child: Button(
                text: 'Logout',
                action: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MyApp()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
