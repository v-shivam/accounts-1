import 'package:flutter/material.dart';

class TransactionWidget extends StatelessWidget {
  bool? isIncrease;
  int? amount;
  String? specification;

  TransactionWidget(
      {required this.isIncrease,
      required this.amount,
      required this.specification});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: isIncrease!
            ? Icon(Icons.arrow_circle_up, color: Colors.green)
            : Icon(Icons.arrow_circle_down, color: Colors.red),
        title: Text(amount!.toString()),
        subtitle: Text(specification!),
      ),
    );
  }
}

TransactionWidget Transaction1 =
    TransactionWidget(isIncrease: true, amount: 500, specification: "Food");
TransactionWidget Transaction2 =
    TransactionWidget(isIncrease: false, amount: 500, specification: "Food");
TransactionWidget Transaction3 =
    TransactionWidget(isIncrease: true, amount: 500, specification: "Food");

class TransactionDetail extends StatelessWidget {
  bool? isSpent;
  int? amount;
  String? specification;
  String? detail;
  String? date;

  TransactionDetail(
      {required this.isSpent,
      required this.amount,
      required this.specification,
      required this.detail,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(specification!),
        subtitle: Text(detail!),
        trailing: RichText(
          text: new TextSpan(
            style: new TextStyle(
              fontSize: 14.0,
              color: Colors.black,
            ),
            children: <TextSpan>[
              new TextSpan(
                  text: amount.toString(),
                  style:
                      TextStyle(color: isSpent! ? Colors.red : Colors.green)),
              new TextSpan(text: '\n\n' + date!),
            ],
          ),
        ),
      ),
    );
  }
}

TransactionDetail TransactionD1 = TransactionDetail(
    isSpent: true,
    amount: 5000,
    specification: "Food",
    detail: "McPoli",
    date: "15/06/2023");
TransactionDetail TransactionD2 = TransactionDetail(
    isSpent: true,
    amount: 5000,
    specification: "Food",
    detail: "McPoli",
    date: "15/06/2023");
TransactionDetail TransactionD3 = TransactionDetail(
    isSpent: true,
    amount: 5000,
    specification: "Food",
    detail: "McPoli",
    date: "15/06/2023");
