import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:le_menu_mobile/services/base_connect.dart';
import '../../models/table/table.dart' as my;
import 'package:http/http.dart' as http;

class TableConnect extends BaseConnect {
  // Search
  Future<Response> search(String code) async {
    debugPrint('Table Connect: ' + code);
    final response = await get(
      '/table/search/by-code?code=$code',
    );
    //Get.log(response.body.toString());
    debugPrint(response.body.toString());

    return response;
  }

  // Update
  Future<Response> open(int id) async {
    debugPrint('Table Connect');
    final response = await put('/table/open/${id.toString()}', '');
    //Get.log(response.body.toString());
    debugPrint(response.body.toString());

    return response;
  }

  // Open
  Future<Response> update(my.Table table) async {
    debugPrint('Table Connect');
    final response =
        await put('/table/open/${table.id.toString()}', table.toJson());
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
