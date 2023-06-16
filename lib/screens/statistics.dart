import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
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
              child: PieChart(PieChartData(
                  centerSpaceRadius: 10,
                  borderData: FlBorderData(show: false),
                  sections: [
                    PieChartSectionData(
                        value: 10, color: Colors.purple, radius: 100),
                    PieChartSectionData(
                        value: 20, color: Colors.amber, radius: 100),
                    PieChartSectionData(
                        value: 30, color: Colors.green, radius: 100)
                  ])),
            ),
            Divider(color: Colors.black),
            Text("Food",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.purple)),
            Text("Entertainment",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.amber)),
            Text("Bills/EMIs",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.green)),
          ],
        ),
      ),
    );
  }
}
