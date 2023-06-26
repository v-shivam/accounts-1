import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  void initState() {

    super.initState();
    updateValueHelper();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF6E5),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 60, 20, 40),
        child: Column(
          children: [
            Container(
              height: 100,
              child: Text("Statistics",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
            ),
            Container(
              height: 300,
              child: PieChart(PieChartData(centerSpaceRadius: 10, sections: [
                PieChartSectionData(
                    value: categoryWiseExpense["Food"],
                    color: Colors.purple,
                    radius: 100),
                PieChartSectionData(
                    value: categoryWiseExpense["Transport"],
                    color: Colors.amber,
                    radius: 100),
                PieChartSectionData(
                    value: categoryWiseExpense["Personal"],
                    color: Colors.green,
                    radius: 100),
                PieChartSectionData(
                    value: categoryWiseExpense["Shopping"],
                    color: Colors.red,
                    radius: 100),
                PieChartSectionData(
                    value: categoryWiseExpense["Rent"],
                    color: Colors.orange,
                    radius: 100),
                PieChartSectionData(
                    value: categoryWiseExpense["Medical"],
                    color: Colors.pink,
                    radius: 100),
                PieChartSectionData(
                    value: categoryWiseExpense["Movie"],
                    color: Colors.yellow,
                    radius: 100),
                PieChartSectionData(
                    value: categoryWiseExpense["Salary"],
                    color: Colors.blue,
                    radius: 100)
              ])),
            ),
            Divider(color: Colors.black),
            Text("Food",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.purple)),
            Text("Transport",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.amber)),
            Text("Personal",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.green)),
            Text("Shopping",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.red)),
            Text("Rent",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.orange)),
            Text("Medical",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.pinkAccent)),
            Text("Movie",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.yellow)),
            Text("Salary",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.lightBlue)),
          ],
        ),
      ),
    );
  }
}

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

void updateValueHelper() async {
  await updateValues();
}

Future<void> updateValues() async {
  await FirebaseFirestore.instance.collection("transactions").get().then(
    (querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {
        categoryWiseExpense[docSnapshot['desc_short']] =
            (categoryWiseExpense[docSnapshot['desc_short']] ??
                0.0 + docSnapshot['amount']);
      }
    },
  );
}

void resetValues() {
  for (var category in categories) {
    categoryWiseExpense[category] = 0;
  }
}

Map<String, double> categoryWiseExpense = {
  "Food": 0.0,
  "Transport": 0.0,
  "Personal": 0,
  "Shopping": 0,
  "Medical": 0,
  "Rent": 0,
  "Movie": 0,
  "Salary": 0
};
