import 'package:flutter/material.dart';

class MyBillsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bills Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BillsScreen(),
    );
  }
}

class BillsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Bills'),
        actions: [
          IconButton(
            icon: Icon(Icons.add_alert),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return BillCard(index: index);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

class BillCard extends StatelessWidget {
  final int index;

  const BillCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Icon(Icons.receipt, color: Colors.blue),
        title: Text('Bill ${index + 1}', style: TextStyle(color: Colors.blue)),
        subtitle: Text(
            'Due date: ${DateTime.now().add(Duration(days: index * 7)).toLocal()}'),
        trailing:
            Text('\$${(index + 1) * 75}', style: TextStyle(color: Colors.blue)),
        onTap: () {},
      ),
    );
  }
}
