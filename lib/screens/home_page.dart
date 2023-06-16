import 'package:accounts/components/transaction_widget.dart';
import 'package:accounts/screens/add_new_transaction.dart';
import 'package:accounts/screens/all_transactions_screen.dart';
import 'package:accounts/screens/profile.dart';
import 'package:accounts/screens/statistics.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    void _onItemTapped(int index) {
      if (index == 0) {
      } else if (index == 1) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => AllTransactionsPage()));
      } else if (index == 2) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => StatisticsPage()));
      } else if (index == 3) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfilePage()));
      }
    }

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 351,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 40, 10, 40),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text("Monday 9 \nNovember",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400))),
                        Text("Vishnu",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  Divider(color: Colors.black),
                  SizedBox(height: 40),
                  Text("Account Balance",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  Text("9400.0",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w700)),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 80,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Color(0xFF00A86B),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            "Income \n25000",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            "Expense \n11200",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 30,
              ),
              Expanded(
                child: Text("Recent Transactions",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              ),
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AllTransactionsPage()));
                      },
                      child: Text("View All",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)))),
            ],
          ),
          Divider(color: Colors.black),
          Container(
            height: 250.0,
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView(
                children: [
                  Transaction1,
                  Transaction2,
                  Transaction3,
                  Transaction1,
                  Transaction2,
                  Transaction3
                ],
              ),
            ),
          )
        ],
      ),
      backgroundColor: Color(0xFFFFF6E5),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timeline),
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NewTransactions()));
        },
        backgroundColor: Colors.black,
      ),
    );
  }
}
