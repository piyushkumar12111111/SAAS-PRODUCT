import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

class MoneySpendController extends GetxController {
  var spendingData = <FlSpot>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadSpendingData();
  }

  void loadSpendingData() {
 
    spendingData.value = [
      FlSpot(0, 3),
      FlSpot(1, 2.5),
      FlSpot(2, 4),
   
    ];
  }
}
