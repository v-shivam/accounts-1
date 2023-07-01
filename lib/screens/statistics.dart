import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:accounts/components/constants.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    String email = auth.currentUser!.email!;
    return Scaffold(
      backgroundColor: Color(0xFFFFF6E5),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        child: Column(
          children: [
            Container(
              height: 50,
              child: Text("Statistics",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
            ),
            Container(
              height: 400,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    width: 350,
                    child: PieChart(PieChartData(centerSpaceRadius: 45, sections: [
                      PieChartSectionData(
                          value: categoryWiseExpense["Food"],
                          color: Colors.purple,
                          radius: 90,
                          showTitle: false),
                      PieChartSectionData(
                          value: categoryWiseExpense["Transport"],
                          color: Colors.amber,
                          radius: 90,
                          showTitle: false),
                      PieChartSectionData(
                          value: categoryWiseExpense["Personal"],
                          color: Colors.green,
                          radius: 90,
                          showTitle: false),
                      PieChartSectionData(
                          value: categoryWiseExpense["Shopping"],
                          color: Colors.red,
                          radius: 90,
                          showTitle: false),
                      PieChartSectionData(
                          value: categoryWiseExpense["Rent"],
                          color: Colors.orange,
                          radius: 90,
                          showTitle: false),
                      PieChartSectionData(
                          value: categoryWiseExpense["Medical"],
                          color: Colors.pink,
                          radius: 90,
                          showTitle: false),
                      PieChartSectionData(
                          value: categoryWiseExpense["Movie"],
                          color: Colors.yellow,
                          radius: 90,
                          showTitle: false),
                      PieChartSectionData(
                          value: categoryWiseExpense["Salary"],
                          color: Colors.blue,
                          radius: 90,
                          showTitle: false)
                    ])),
                  ),
                  Container(
                    width: 350,
                    child: PieChart(PieChartData(centerSpaceRadius: 45, sections: [
                      PieChartSectionData(
                          value: categoryWiseIncome["Food"],
                          color: Colors.purple,
                          radius: 90,
                          showTitle: false),
                      PieChartSectionData(
                          value: categoryWiseIncome["Transport"],
                          color: Colors.amber,
                          radius: 90,
                          showTitle: false),
                      PieChartSectionData(
                          value: categoryWiseIncome["Personal"],
                          color: Colors.green,
                          radius: 90,
                          showTitle: false),
                      PieChartSectionData(
                          value: categoryWiseIncome["Shopping"],
                          color: Colors.red,
                          radius: 90,
                          showTitle: false),
                      PieChartSectionData(
                          value: categoryWiseIncome["Rent"],
                          color: Colors.orange,
                          radius: 90,
                          showTitle: false),
                      PieChartSectionData(
                          value: categoryWiseIncome["Medical"],
                          color: Colors.pink,
                          radius: 90,
                          showTitle: false),
                      PieChartSectionData(
                          value: categoryWiseIncome["Movie"],
                          color: Colors.yellow,
                          radius: 90,
                          showTitle: false),
                      PieChartSectionData(
                          value: categoryWiseIncome["Salary"],
                          color: Colors.blue,
                          radius: 90,
                          showTitle: false)
                    ])),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("<- Expenses",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black)),
                Text("Income ->",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black)),
              ],
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
