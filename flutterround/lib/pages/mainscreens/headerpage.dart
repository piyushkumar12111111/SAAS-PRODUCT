import 'package:firebase_loginout_auth/pages/connectscreen/bills.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<Map<String, dynamic>> quickActions = [
    {'icon': Icons.receipt, 'label': 'Bills'},
    {'icon': Icons.power_off, 'label': 'Disconnect'},
    {'icon': Icons.swap_horiz, 'label': 'Transfer'},
    {'icon': Icons.settings, 'label': 'Services'},
    {'icon': Icons.report_problem, 'label': 'Complaint'},
    {'icon': Icons.update, 'label': 'Update'},
    // {'icon': Icons.link, 'label': 'Connect...'},
    // {'icon': Icons.warning, 'label': 'Outage'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.menu),
        actions: [
          Icon(Icons.search),
          SizedBox(width: 10),
          Icon(Icons.notifications)
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(
                top: 70, 
                left: 20,
                child: Text(
                  'Hello\nThomas',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                top: 100,
                right:
                    -20,
                child: CircleAvatar(
                  radius: 50, 
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage(
                        'lib/images/Ellipse 226.png'), 
                  ),
                ),
              ),
              // The quick actions section
              Positioned(
                top: 250, 
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      // Text(
                      //   'Quick Actions',
                      //   style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 24,
                      //       fontWeight: FontWeight.bold),
                      // ),
                      // SizedBox(height: 16),
                      // Wrap(
                      //   spacing: 20, // Space between the action items
                      //   runSpacing: 20, // Space between the rows
                      //   children: List.generate(6, (index) => QuickActionButton()),
                      // ),

                      SingleChildScrollView(
                        child: Container(
                          height: 600,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 22,
                              ),
                              GridView.builder(
                                shrinkWrap: true,
                                physics:
                                    NeverScrollableScrollPhysics(), 
                                itemCount: quickActions.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3, 
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 4, 
                                  childAspectRatio:
                                      1, 
                                ),
                                itemBuilder: (context, index) {
                                  return QuickActionItem(
                                    iconData: quickActions[index]['icon'],
                                    label: quickActions[index]['label'],
                                    nextScreen: BillsScreen(),
                                  );
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: MyCustomRow(),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: BillCard(
                                    title: 'Bills',
                                    date: '20 Jan 2020',
                                    amount: 43,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: BillCard(
                                    title: 'Bills',
                                    date: '20 Fab 2020',
                                    amount: 43,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuickActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(Icons.ac_unit,
              color: Colors.grey), // Replace with actual icons
        ),
        SizedBox(height: 8),
        Text('Action',
            style: TextStyle(color: Colors.white)), // Replace with actual text
      ],
    );
  }
}

class QuickActionItem extends StatelessWidget {
  final IconData iconData;
  final String label;
  final Widget nextScreen;

  const QuickActionItem({
    Key? key,
    required this.iconData,
    required this.label,
    required this.nextScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextScreen),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData, color: Colors.blue), // Icon with blue color
          SizedBox(height: 8), // Space between icon and text
          Text(label, textAlign: TextAlign.center), // Text label
        ],
      ),
    );
  }
}

//! bill card

class BillCard extends StatelessWidget {
  final String title;
  final String date;
  final double amount;

  const BillCard({
    Key? key,
    required this.title,
    required this.date,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        child: Row(
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                value:
                    0.75, // This should be dynamic based on the bill payment status
                backgroundColor: Colors.blue.shade100,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              '\$$amount',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//! row component

class MyCustomRow extends StatefulWidget {
  @override
  _MyCustomRowState createState() => _MyCustomRowState();
}

class _MyCustomRowState extends State<MyCustomRow> {
  String dropdownValue = 'Last Month';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            'Gas',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.purple,
              fontSize: 18,
            ),
          ),
          SizedBox(width: 8),
          Text(
            '|',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              fontSize: 18,
            ),
          ),
          SizedBox(width: 8),
          Text(
            'SA1234567',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          Spacer(),
          DropdownButton<String>(
            value: dropdownValue,
            borderRadius: BorderRadius.circular(10),
            icon: const Icon(Icons.arrow_drop_down),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>['Last Month', 'Last 3 Months', 'Last Year']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
