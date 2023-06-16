import 'package:accounts/components/transaction_widget.dart';
import 'package:flutter/material.dart';

class AllTransactionsPage extends StatefulWidget {
  const AllTransactionsPage({super.key});

  @override
  State<AllTransactionsPage> createState() => _AllTransactionsPageState();
}

class _AllTransactionsPageState extends State<AllTransactionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF6E5),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 40, 10, 40),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
              child: Text("Transactions",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ),
            Container(
              height: 600,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView(
                  children: [
                    TransactionD1,
                    TransactionD2,
                    TransactionD3,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
