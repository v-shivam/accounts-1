import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  String? text;
  Function? action;

  Button({this.text, this.action});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 42,
        width: 194,
        child: ElevatedButton(
            onPressed: () {
              if (action != null) {
                action!();
              }
              ;
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              onPrimary: Colors.white,
              elevation: 3,
            ),
            child: Text(text!, style: TextStyle(fontSize: 20))));
  }
}
