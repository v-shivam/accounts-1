import 'package:accounts/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF6E5),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40.0, 100, 37.0, 0.0),
          child: Column(
            children: [
              CircleAvatar(
                  child: Icon(Icons.monetization_on,
                      size: 100, color: Colors.white),
                  radius: 90,
                  backgroundColor: Colors.orange),
              Text("Hisaab",
                  style: TextStyle(fontSize: 60, fontWeight: FontWeight.w700)),
              SizedBox(height: 90),
              Text("Simple solution for your budget.",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
              SizedBox(height: 30),
              Text("Control and distribute your income correctly.",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
              SizedBox(height: 35),
              SizedBox(
                  height: 42,
                  width: 194,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        onPrimary: Colors.white,
                        elevation: 3,
                      ),
                      child: Text("Continue", style: TextStyle(fontSize: 20)))),
            ],
          ),
        ),
      ),
    );
  }
}
