import 'package:flutter/material.dart';
import '../components/buttons.dart';
import 'package:accounts/components/text_form_field.dart';
import 'login_screen.dart';
import 'package:accounts/screens/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:accounts/components/firebase_functions.dart';

final auth = FirebaseAuth.instance;
final db = FirebaseFirestore.instance;
TextEditingController userEmail = TextEditingController();
TextEditingController userPassword = TextEditingController();
TextEditingController confirmUserPassword = TextEditingController();
TextEditingController userName = TextEditingController();

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF6E5),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 90,
            ),
            const SizedBox(
              height: 60,
            ),
            CustomTextFormField(
              controller: userName,
              hintText: "Enter User Name",
              labelText: "User Name",
              prefixIcon: Icons.person,
              inputType: TextInputType.text,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              controller: userEmail,
              labelText: "Email",
              hintText: "Enter Email",
              prefixIcon: Icons.email_outlined,
              inputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: userPassword,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.password),
                labelText: "Password",
                hintText: "Enter Password",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: confirmUserPassword,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.password),
                labelText: "Confirm Password",
                hintText: "Confirm Password",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
            ),
            SizedBox(
              height: 30,
            ),
            Hero(
              tag: "SIGNUP",
              child: Button(
                text: "Sign Up",
                action: () async {
                  final user = <String, dynamic>{
                    "user_name": userName.text,
                  };
                  await db.collection('user_email_to_username').doc(userEmail.text).set(user);
                  await signUp(auth, userEmail.text, userPassword.text);
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Have an account ?", style: TextStyle(fontSize: 15)),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInPage()));
                    },
                    child: Text("Sign In !")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
