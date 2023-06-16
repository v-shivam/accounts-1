import 'package:accounts/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:accounts/components/buttons.dart';
import 'package:accounts/components/text_form_field.dart';
import 'package:accounts/screens/home_page.dart';

TextEditingController userEmail = TextEditingController();
TextEditingController userPassword = TextEditingController();

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF6E5),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 140,
            ),
            const SizedBox(
              height: 70,
            ),
            CustomTextFormField(
                controller: userEmail,
                hintText: "Enter Email",
                labelText: "Email",
                inputType: TextInputType.emailAddress,
                prefixIcon: Icons.email_outlined),
            SizedBox(
              height: 30,
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
            Hero(
              tag: "LOGIN",
              child: Button(
                text: "Login",
                action: () async {
                  //await signIn(userEmail.text, userPassword.text);
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don\'t have an account ?",
                    style: TextStyle(fontSize: 15)),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                    },
                    child: Text("Sign Up !")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
