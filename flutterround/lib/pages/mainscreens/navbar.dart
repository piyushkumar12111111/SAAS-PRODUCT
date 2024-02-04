import 'package:firebase_loginout_auth/pages/accountmanager/amountspend.dart';
import 'package:firebase_loginout_auth/pages/mainscreens/headerpage.dart';
import 'package:firebase_loginout_auth/pages/mainscreens/home_page.dart';
import 'package:firebase_loginout_auth/pages/mainscreens/usage.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    DashboardScreen(),
    ElectricityUsagePage(),
    ExpenseOverviewScreen(),
    SupportScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              buildTabItem(icon: Icons.dashboard, index: 0, text: 'Dashboard'),
              buildTabItem(icon: Icons.timeline, index: 1, text: 'Usage'),
              buildTabItem(icon: Icons.history, index: 2, text: 'History'),
              buildTabItem(
                  icon: Icons.support_agent, index: 3, text: 'Support'),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTabItem({
    required IconData icon,
    required int index,
    required String text,
  }) {
    return InkWell(
      onTap: () => setState(() => _currentIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: _currentIndex == index ? Colors.red : Colors.grey),
          Text(text,
              style: TextStyle(
                  color: _currentIndex == index ? Colors.red : Colors.grey)),
        ],
      ),
    );
  }
}
