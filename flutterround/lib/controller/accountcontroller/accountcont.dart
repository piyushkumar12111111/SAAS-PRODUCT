import 'package:get/get.dart';

class ExpenseController extends GetxController {
  var touchedIndex = (-1).obs;

  void changeTouchedIndex(int newIndex) {
    touchedIndex.value = newIndex;
  }
}
