import 'package:get/get.dart';

class MySnackBar {
  static void errorSnackbar(String message) {
    Get.showSnackbar(
      GetSnackBar(
        title: "Erro!",
        message: message,
        isDismissible: true,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
