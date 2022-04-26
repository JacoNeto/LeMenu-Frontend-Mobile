import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:le_menu_mobile/controllers/home_controller.dart';
import 'package:le_menu_mobile/utils/widgets/my_snackbar.dart';

import '../models/client/client_register/client_register.dart';
import '../services/connect/client_connect.dart';

class NameController extends GetxController {
  final HomeController homeController = Get.find();
  final ClientConnect _connect = Get.put(ClientConnect());

  var name = "";
  var isLoading = false.obs;
  var error = false;

  /// Open Table
  Future<void> newUser() async {
    isLoading.value = true;
    ClientRegister clientRegister =
        ClientRegister(name: name, tableId: homeController.id);

    final Response response = await _connect.newClient(clientRegister);

    if (!response.isOk) {
      error = true;
      debugPrint(response.bodyString);
      isLoading.value = false;
    }
    isLoading.value = false;
  }
}
