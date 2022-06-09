import 'package:get/get_connect/http/src/response/response.dart';
import 'package:flutter/material.dart';

import '../../models/product/product.dart';
import '../base_connect.dart';

class ProductConnect extends BaseConnect {
  // getAll
  Future<Response> getAll() async {
    debugPrint('Product Connect');
    final response = await get('/product/search/all');
    //Get.log(response.body.toString());
    debugPrint(response.body.toString());

    return response;
  }

  // Put
  Future<Response> putInto(int id) async {
    debugPrint('Table Connect');
    final response = await put('/product/put/${id.toString()}', '');
    //Get.log(response.body.toString());
    debugPrint(response.body.toString());

    return response;
  }

  // Peek
  Future<Response> peek(int id) async {
    debugPrint('Table Connect');
    final response = await put('/product/peek/${id.toString()}', '');
    //Get.log(response.body.toString());
    debugPrint(response.body.toString());

    return response;
  }
}
