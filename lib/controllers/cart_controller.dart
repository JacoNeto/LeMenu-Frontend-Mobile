import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/ordered/ordered.dart';
import '../models/product/product.dart';
import '../services/connect/table_connect.dart';
import '../utils/json_utils.dart';
import 'package:le_menu_mobile/models/table/table.dart' as my;

import '../utils/widgets/my_snackbar.dart';
import 'home_controller.dart';

class CartController extends GetxController {
  var isLoading = false.obs;
  var error = false;

  final HomeController _homeController = Get.find();
  final TableConnect _tableConnect = Get.put(TableConnect());

  /// Fetch all ordered products from database
  Future<List<Ordered>?> getOrdered(int id) async {
    List<Ordered> list = [];

    final Response response = await _tableConnect.getOrder(id);

    if (!response.isOk) {
      error = true;
      debugPrint(response.bodyString);
      MySnackBar.errorSnackbar("algo deu errado");
    } else {
      JsonUtils.prettyprint(response);
      list = JsonUtils.getOrderedList(response);
      return list;
    }

    return null;
  }

  /// Close Table
  Future<void> close() async {
    error = false;
    isLoading.value = true;
    my.Table table = my.Table();

    final Response response = await _tableConnect.search(_homeController.code);

    if (response.isOk) {
      JsonUtils.prettyprint(response);
      table = JsonUtils.getTable(response) ?? my.Table();
      debugPrint(table.id.toString());

      await _tableConnect.open(_homeController.id);
      isLoading.value = false;
    } else {
      error = true;
      debugPrint(response.bodyString);
      MySnackBar.errorSnackbar("algo deu errado");
    }
    isLoading.value = false;
  }

  /// Update Table
  Future<void> updateTable(double total) async {
    error = false;
    isLoading.value = true;
    my.Table table = my.Table();

    final Response response = await _tableConnect.update(my.Table(
      id: _homeController.id,
    ));

    if (response.isOk) {
      JsonUtils.prettyprint(response);
      table = JsonUtils.getTable(response) ?? my.Table();
      debugPrint(table.id.toString());

      await _tableConnect.open(_homeController.id);
      isLoading.value = false;
    } else {
      error = true;
      debugPrint(response.bodyString);
      MySnackBar.errorSnackbar("algo deu errado");
    }
    isLoading.value = false;
  }
}
