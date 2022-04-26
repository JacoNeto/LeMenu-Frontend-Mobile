import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:le_menu_mobile/models/table/table.dart' as my;

import '../services/connect/table_connect.dart';
import '../utils/json_utils.dart';
import '../utils/widgets/my_snackbar.dart';

class HomeController extends GetxController {
  final TableConnect _connect = Get.put(TableConnect());

  var table = "";
  var isLoading = false.obs;

  var code = "";
  var id = 0;

  var error = false;

  /// Open Table
  Future<void> open() async {
    error = false;
    isLoading.value = true;
    my.Table table = my.Table();

    final Response response = await _connect.search(code);

    if (response.isOk) {
      JsonUtils.prettyprint(response);
      table = JsonUtils.getTable(response) ?? my.Table();
      debugPrint(table.id.toString());

      if (table.isOpen == false) {
        error = true;
        MySnackBar.errorSnackbar("a mesa já está em uso");
      }
      id = table.id!;
    } else {
      error = true;
      debugPrint(response.bodyString);
      MySnackBar.errorSnackbar("a mesa não existe");
    }
    isLoading.value = false;
  }

  void clear() {
    table = "";
    isLoading = false.obs;

    code = "";
    id = 0;
  }
}
