import 'package:flutter/material.dart';
import 'package:accounts/components/text_form_field.dart';
import 'package:accounts/components/buttons.dart';
import 'home_page.dart';

class NewTransactions extends StatefulWidget {
  const NewTransactions({super.key});

  @override
  State<NewTransactions> createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  @override
  Widget build(BuildContext context) {
    TextEditingController transactionCategory = TextEditingController();
    TextEditingController transactionDescription = TextEditingController();
    TextEditingController amount = TextEditingController();
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
            SizedBox(height: 20),
            CustomTextFormField(
              controller: transactionCategory,
              hintText: "Enter Category",
              labelText: "Category",
              inputType: TextInputType.text,
            ),
            SizedBox(
              height: 30,
            ),
            CustomTextFormField(
              controller: transactionDescription,
              labelText: "Description",
              hintText: "Enter Description",
              inputType: TextInputType.text,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              controller: amount,
              hintText: "Enter Amount",
              labelText: "Amount",
              inputType: TextInputType.number,
            ),
            SizedBox(
              height: 20,
            ),
            ToggleButtons(
              children: options,
              isSelected: isSelected,
              selectedColor: Colors.black,
              splashColor: Colors.white,
              onPressed: (int index) {
                setState(() {
                  for (int buttonIndex = 0;
                      buttonIndex < isSelected.length;
                      buttonIndex++) {
                    if (buttonIndex == index) {
                      isSelected[buttonIndex] = true;
                    } else {
                      isSelected[buttonIndex] = false;
                    }
                  }
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            Button(
              text: "Continue",
              action: () async {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}

const List<Widget> options = <Widget>[
  Padding(
    padding: EdgeInsets.all(8.0),
    child: Text("Expense",
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w700, color: Colors.red)),
  ),
  Padding(
    padding: EdgeInsets.all(8.0),
    child: Text("Income",
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w700, color: Colors.green)),
  )
];

List<bool> isSelected = <bool>[
  false,
  false,
];
