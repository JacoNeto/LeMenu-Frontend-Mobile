import 'package:get/get.dart';

class CardapioController extends GetxController {
  var selected = 0.obs;
  var total = 0.0.obs;

  void select() {
    selected++;
    total.value += 20.0;
  }

  void unselect() {
    selected--;
    total.value -= 20.0;
  }

  void clear() {
    selected.value = 0;
    total.value = 0;
  }
}
