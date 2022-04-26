import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:le_menu_mobile/services/base_connect.dart';

class TableConnect extends BaseConnect {
  // Search
  Future<Response> search(String code) async {
    debugPrint('Table Connect');
    final response = await get(
      '/table/search/by-code?code=$code',
    );
    //Get.log(response.body.toString());
    debugPrint(response.body.toString());

    return response;
  }

  // Open
  Future<Response> open(int id) async {
    debugPrint('Table Connect');
    final response = await put('/table/open/${id.toString()}', '');
    //Get.log(response.body.toString());
    debugPrint(response.body.toString());

    return response;
  }

  // Close
  Future<Response> close(int id) async {
    debugPrint('Table Connect');
    final response = await put('/table/close/${id.toString()}', '');
    //Get.log(response.body.toString());
    debugPrint(response.body.toString());

    return response;
  }
}
