import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ElectricityUsagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Electricity Usage Chart',
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: 300,
                child: LineChartSample1(),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: MonthYearPicker(),
            ),
            SizedBox(height: 40),
            Text(
              "Comparison Between Electricity Usage",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: 200,
                child: ComparisonChart(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LineChartSample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        minX: 0,
        maxX: 11,
        minY: 0,
        maxY: 6,
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 3),
              FlSpot(2.6, 2),
              FlSpot(4.9, 5),
              FlSpot(6.8, 2.5),
              FlSpot(8, 4),
              FlSpot(9.5, 3),
              FlSpot(11, 4),
            ],
            isCurved: true,
            color: Colors.blueAccent,
            barWidth: 4,
            isStrokeCapRound: true,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }
}

class MonthYearPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        DropdownButton<String>(
          value: 'Jan',
          items: ['Jan', 'Feb', 'Mar', 'Apr'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (_) {},
        ),
        DropdownButton<String>(
          value: '2020',
          items: ['2020', '2021', '2022', '2023'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (_) {},
        ),
      ],
    );
  }
}

class ComparisonChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            horizontalInterval: 1,
            verticalInterval: 1,
          ),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.grey, width: 1),
          ),
          minX: 0,
          maxX: 12,
          minY: 0,
          maxY: 6,
          lineBarsData: comparisonSpots(),
        ),
      ),
    );
  }

  List<LineChartBarData> comparisonSpots() {
    final LineChartBarData line1 = LineChartBarData(
      spots: [
        FlSpot(0, 3),
        FlSpot(3, 2),
        FlSpot(6, 5),
        FlSpot(9, 3.5),
        FlSpot(12, 4),
      ],
      isCurved: true,
      color: Colors.blue,
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
    );

    final LineChartBarData line2 = LineChartBarData(
      spots: [
        FlSpot(0, 4),
        FlSpot(3, 3.5),
        FlSpot(6, 4.5),
        FlSpot(9, 4),
        FlSpot(12, 5),
      ],
      isCurved: true,
      color: Colors.orange,
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
    );

    return [line1, line2];
  }
}
