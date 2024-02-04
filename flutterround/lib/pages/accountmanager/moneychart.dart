import 'package:firebase_loginout_auth/controller/accountcontroller/moneyspendcontroller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoneySpendAnalyticsScreen extends StatelessWidget {
  final MoneySpendController controller = Get.put(MoneySpendController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Money Spend Analytics'),
      ),
      body: Obx(() => LineChart(
            LineChartData(
              lineBarsData: [
                LineChartBarData(
                  spots: controller.spendingData,
                  isCurved: true,
                  color: Colors.red,
                  barWidth: 4,
                  isStrokeCapRound: true,
                  dotData: FlDotData(show: false),
                  belowBarData: BarAreaData(show: false),
                ),
              ],
            ),
          )),
    );
  }
}
