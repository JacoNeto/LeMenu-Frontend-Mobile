import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/connect/table_connect.dart';
import 'package:le_menu_mobile/models/table/table.dart' as my;

import '../utils/json_utils.dart';
import '../utils/widgets/my_snackbar.dart';

class AtendenteController extends GetxController {
  final TableConnect _connect = Get.put(TableConnect());

  var isRemoveLoading = false.obs;
  var error = false;

  /// Remove Table
  Future<void> remove(int id) async {
    error = false;
    isRemoveLoading.value = true;

    final Response response = await _connect.remove(id);

    if (response.isOk) {
      debugPrint(response.bodyString);
    } else {
      error = true;
    }
    isRemoveLoading.value = false;
  }

  /// Fetch all tables  from database
  Future<List<my.Table>?> getAll() async {
    List<my.Table> list = [];

    final Response response = await _connect.getAll();

    if (!response.isOk) {
      error = true;
      debugPrint(response.bodyString);
      MySnackBar.errorSnackbar("algo deu errado");
    } else {
      JsonUtils.prettyprint(response);
      list = JsonUtils.getTableList(response);

      return list;
    }

    return null;
  }
}
