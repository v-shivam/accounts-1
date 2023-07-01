import 'package:accounts/components/transaction_widget.dart';
import 'package:accounts/screens/add_new_transaction.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:accounts/components/constants.dart';

class AllTransactionsPage extends StatefulWidget {
  const AllTransactionsPage({super.key});

  @override
  State<AllTransactionsPage> createState() => _AllTransactionsPageState();
}

String _option = "This Week";

class _AllTransactionsPageState extends State<AllTransactionsPage> {
  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;
    final auth = FirebaseAuth.instance;
    String email = auth.currentUser!.email!;

    return Scaffold(
      backgroundColor: Color(0xFFFFF6E5),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 40, 10, 40),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
              child: Text("Transactions",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ),
            SizedBox(
              height: 30,
              child: DropdownButton(
                dropdownColor: Color(0xFFFFF6E5),
                items: optionsForTransactions.map((String option) {
                  return new DropdownMenuItem(
                      value: option,
                      child: SizedBox(
                          width: 250,
                          child: Text(option, style: TextStyle(fontSize: 15))));
                }).toList(),
                onChanged: (newValue) {
                  // do other stuff with _category
                  setState(() => _option = newValue!);
                  print(greaterThanDates[_option]);
                },
                value: _option,
              ),
            ),
            Container(
              height: 600,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("users")
                      .doc(email)
                      .collection("transactions")
                      .where('date', isGreaterThanOrEqualTo: greaterThanDates[_option])
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading");
                    }

                    if (!snapshot.hasData) {
                      return Text("Loading");
                    }

                    return ListView(
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        return GestureDetector(
                            child: TransactionDetail(
                              isSpent: data['is_spent'],
                              specification: data['desc_short'],
                              detail: data['desc_long'],
                              date: data['date'],
                              amount: data['amount'],
                            ),
                            onTap: () {});
                      }).toList(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

