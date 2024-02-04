import 'package:firebase_loginout_auth/controller/accountcontroller/accountcont.dart';
import 'package:firebase_loginout_auth/pages/accountmanager/moneychart.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ExpenseOverviewScreen extends StatelessWidget {
  final ExpenseController controller = Get.put(ExpenseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Overview'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MoneySpendAnalyticsScreen()),
              );
            },
            icon: const Icon(Icons.graphic_eq),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 20),
              Obx(() => PieChartSample(
                    touchedIndex: controller.touchedIndex.value,
                    onTouchedIndexChange: controller.changeTouchedIndex,
                  )),
              SizedBox(height: 20),
              ExpenseList(),
            ],
          ),
        ),
      ),
    );
  }
}

class PieChartSample extends StatefulWidget {
  final int touchedIndex;
  final Function(int) onTouchedIndexChange;

  const PieChartSample({
    Key? key,
    required this.touchedIndex,
    required this.onTouchedIndexChange,
  }) : super(key: key);

  @override
  _PieChartSampleState createState() => _PieChartSampleState();
}

class _PieChartSampleState extends State<PieChartSample> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height:
          MediaQuery.of(context).size.height * 0.4, // Dynamic height adjustment
      child: PieChart(
        PieChartData(
          pieTouchData: PieTouchData(
            touchCallback:
                (FlTouchEvent event, PieTouchResponse? pieTouchResponse) {
              if (event is! PointerExitEvent &&
                  event is! PointerUpEvent &&
                  pieTouchResponse != null) {
                setState(() {
                  touchedIndex =
                      pieTouchResponse.touchedSection!.touchedSectionIndex;
                  widget.onTouchedIndexChange(touchedIndex);
                });
              }
            },
          ),
          borderData: FlBorderData(show: false),
          sectionsSpace: 2, // Add some space between sections
          centerSpaceRadius: 50, // Adjust the radius of the center space
          sections: showingSections(),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius =
          isTouched ? 120.0 : 100.0; // Increase the size for more emphasis
      final widgetColor = getColor(i); // Get color based on index
      return PieChartSectionData(
        color: widgetColor.withOpacity(
            isTouched ? 1.0 : 0.6), // Adjust opacity for touch effect
        value: getValue(i), // Get value based on index
        title: getTitle(i), // Get title based on index
        radius: radius,
        titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                  // Add shadow for better readability
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.5),
                  offset: Offset(2, 2))
            ]),
        // // badgeWidget: _Badge(
        // //     // Use a custom widget for badges
        // //     widgetColor.darken(),
        // //     getTitle(i),
        // //     size: isTouched ? 35.0 : 18.0),
        // badgePositionPercentageOffset: .98,
      );
    });
  }

  String getTitle(int index) {
    switch (index) {
      case 0:
        return 'Food';
      case 1:
        return 'Transport';
      case 2:
        return 'Utilities';
      case 3:
        return 'Entertainment';
      default:
        return '';
    }
  }

  double getValue(int index) {
    switch (index) {
      case 0:
        return 40;
      case 1:
        return 30;
      case 2:
        return 15;
      case 3:
        return 15;
      default:
        return 0;
    }
  }

  Color getColor(int index) {
    switch (index) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.green;
      case 2:
        return Colors.blue;
      case 3:
        return Colors.yellow;
      default:
        return Colors.black;
    }
  }
}

class _Badge extends StatelessWidget {
  final Color color;
  final String text;
  final double size;

  const _Badge(this.color, this.text, {required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Center(
        child: Text(text,
            style: TextStyle(color: Colors.white, fontSize: size / 2.5)),
      ),
      width: size,
      height: size,
    );
  }
}

extension on Color {
  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1, 'amount must be between 0 and 1');
    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }
}

class ExpenseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final expenses = [
      {'icon': Icons.fastfood, 'label': 'Food', 'amount': '-\$150.30'},
      {
        'icon': Icons.directions_bus,
        'label': 'Transport',
        'amount': '-\$75.20'
      },
      {'icon': Icons.flash_on, 'label': 'Utilities', 'amount': '-\$100.00'},
      {
        'icon': Icons.local_movies,
        'label': 'Entertainment',
        'amount': '-\$50.00'
      },
    ];

    return Column(
      children: expenses.map((expense) {
        return ListTile(
          leading: Icon(expense['icon'] as IconData, color: Colors.blue),
          title: Text(expense['label'] as String),
          trailing: Text(expense['amount'] as String,
              style: TextStyle(color: Colors.red)),
        );
      }).toList(),
    );
  }
}
