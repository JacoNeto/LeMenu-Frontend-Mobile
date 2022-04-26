import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/product/product.dart';
import '../services/connect/product_connect.dart';
import '../utils/json_utils.dart';
import '../utils/widgets/my_snackbar.dart';

class CardapioController extends GetxController {
  final ProductConnect _connect = Get.put(ProductConnect());

  var selected = 0.obs;
  var total = 0.0.obs;
  var isLoading = false.obs;

  var error = false;

  var added = <Product>[];

  void select(Product product) {
    selected++;
    total.value += product.price ?? 0;
    added.add(product);
  }

  void unselect(Product product) {
    selected--;
    total.value -= product.price ?? 0;
    added.removeWhere((element) => element.id == product.id);
  }

  void clear() {
    selected.value = 0;
    total.value = 0;
  }

  /// Fetch all products from database
  Future<List<Product>?> getAll() async {
    List<Product> list = [];

    final Response response = await _connect.getAll();

    if (!response.isOk) {
      error = true;
      debugPrint(response.bodyString);
      MySnackBar.errorSnackbar("algo deu errado");
    } else {
      JsonUtils.prettyprint(response);
      list = JsonUtils.getProductList(response);

      return list;
    }

    return null;
  }

  /// Change Select
  Future<void> changeSelect() async {
    error = false;
    isLoading.value = true;

    if (added.isNotEmpty) {
      for (var element in added) {
        if (element.isOnMenu!) {
          var response = await _connect.putInto(element.id!);
          myError(response);
        } else {
          var response = await _connect.peek(element.id!);
          myError(response);
        }
      }
    }

    isLoading.value = false;
  }

  void myError(Response response) {
    if (!response.isOk) {
      error = true;
      MySnackBar.errorSnackbar("algo deu errado");
    }
  }
}
