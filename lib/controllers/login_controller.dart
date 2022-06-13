import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:le_menu_mobile/utils/local_save.dart';

import '../services/connect/login_connect.dart';
import '../utils/json_utils.dart';

class LoginController extends GetxController {
  final LoginConnect _connect = Get.put(LoginConnect());

  var login = "";
  var password = "";

  String? token = "";
  var isLogged = false;

  var isLoading = false.obs;

  var error = false;

  /// Open Table
  Future<void> signin() async {
    isLogged = false;
    error = false;
    isLoading.value = true;

    final Response response = await _connect.login(login, password);

    if (response.isOk) {
      isLogged = true;
      // show the token returned in the terminal
      // String tokenn = await LocalSave().read("accessToken");

      isLogged = true;
      // debugPrint(tokenn);
    } else {
      error = true;
    }
    isLoading.value = false;
  }
}
