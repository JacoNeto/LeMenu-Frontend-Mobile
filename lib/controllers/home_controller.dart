import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:le_menu_mobile/models/table/table.dart' as my;

import '../services/connect/table_connect.dart';
import '../utils/json_utils.dart';

class HomeController extends GetxController {
  final TableConnect _connect = Get.put(TableConnect());

  var table = "";
  var isLoading = false.obs;

  var code = "";

  /// Open Table
  Future<void> open() async {
    isLoading.value = true;
    my.Table table = my.Table();

    final Response response = await _connect.search(code);

    if (response.isOk) {
      JsonUtils.prettyprint(response);
      table = JsonUtils.getTable(response) ?? my.Table();
      debugPrint(table.id.toString());

      await _connect.open(table.id!);
      isLoading.value = false;
    } else {
      debugPrint('erro');
    }
  }
}
