import 'package:flutter/material.dart';
import 'package:accounts/components/text_form_field.dart';
import 'package:accounts/components/buttons.dart';
import 'home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class NewTransactions extends StatefulWidget {
  const NewTransactions({super.key});

  @override
  State<NewTransactions> createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {

  TextEditingController transactionDescription = TextEditingController();
  TextEditingController amount = TextEditingController();
  String _category = "Food";

  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;
    DateTime dateToday =new DateTime.now();
    String date = dateToday.toString().substring(0,10);

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
            DropdownButton(
              dropdownColor: Color(0xFFFFF6E5),
              items: categories.map((String category) {
                return new DropdownMenuItem(
                    value: category,
                    child: SizedBox(width: 250,child: Text(category, style: TextStyle(fontSize: 22)))
                );
              }).toList(),
              onChanged: (newValue) {
                // do other stuff with _category
                setState(() => _category = newValue!);
              },
              value: _category,
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
                final transaction = <String, dynamic>{
                  "amount": int.parse(amount.text),
                  "desc_short": _category,
                  "desc_long": transactionDescription.text,
                  'is_spent' : isSelected[0],
                  'date' : date,
                };
                await db.collection("transactions").add(transaction);

                if(isSelected[0]) {
                  var netExpenseRef = db.collection('net_expenses').doc(
                      'expense');
                  await netExpenseRef.update(
                    {"amount": FieldValue.increment(double.parse(amount.text))},
                  );
                  var netBalanceRef = db.collection('net_expenses').doc('balance');
                  await netBalanceRef.update( {"amount": FieldValue.increment(-double.parse(amount.text))},);
                }else{
                  var netIncomeRef = db.collection('net_expenses').doc(
                      'income');
                  var netBalanceRef = db.collection('net_expenses').doc('balance');
                  await netIncomeRef.update(
                    {"amount": FieldValue.increment(double.parse(amount.text))},
                  );
                  await netBalanceRef.update( {"amount": FieldValue.increment(double.parse(amount.text))},);
                }

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


var categories = [
  "Food",
  "Transport",
  "Personal",
  "Shopping",
  "Medical",
  "Rent",
  "Movie",
  "Salary"
];