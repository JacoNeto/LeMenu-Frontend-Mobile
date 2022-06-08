import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:le_menu_mobile/services/base_connect.dart';
import '../../models/table/table.dart' as my;
import 'package:http/http.dart' as http;

class TableConnect extends BaseConnect {
  // Get All
  Future<Response> getAll() async {
    debugPrint('Table Connect: all');
    final response = await get(
      '/table/search/all',
    );
    //Get.log(response.body.toString());
    debugPrint(response.body.toString());

    return response;
  }

  // Get Order
  Future<Response> getOrder(int id) async {
    debugPrint('Table Connect: orders');
    final response = await get(
      '/table/list/order?id=' + id.toString(),
    );
    //Get.log(response.body.toString());
    debugPrint(response.body.toString());

    return response;
  }

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

  // Remove
  Future<Response> remove(int id) async {
    debugPrint('Table Connect');
    final response = await delete('/table/close/${id.toString()}');
    //Get.log(response.body.toString());
    debugPrint(response.body.toString());

    return response;
  }

  // Add Order
  Future<Response> addOrder(int id, int productId) async {
    debugPrint('Table Connect');
    var ordered = <String, dynamic>{
      "description": "ordered $productId",
      "status": "ordered"
    };
    final response = await put('/table/add-order/${id.toString()}', ordered);
    //Get.log(response.body.toString());
    debugPrint(response.body.toString());

    return response;
  }

  // Add Order
  Future<Response> removeOrder(int id, int orderedId) async {
    debugPrint('Table Connect');
    var ordered = <String, dynamic>{
      "description": "ordered $orderedId",
    };
    final response = await put('/table/add-order/${id.toString()}', ordered);
    //Get.log(response.body.toString());
    debugPrint(response.body.toString());

    return response;
  }
}
