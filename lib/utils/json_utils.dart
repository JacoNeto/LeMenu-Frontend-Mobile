import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:le_menu_mobile/models/client/client.dart';
import 'package:le_menu_mobile/models/ordered/ordered.dart';
import 'package:le_menu_mobile/models/product/product.dart';
import 'package:le_menu_mobile/models/table/table.dart' as my;

class JsonUtils {
  //helper function
  static Future<String> getJsonFile(String path) async {
    ByteData byte = await rootBundle.load(path);
    var list = byte.buffer.asUint8List(byte.offsetInBytes, byte.lengthInBytes);
    return utf8.decode(list);
  }

  static void prettyprint(Response response) {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    String prettyprint = encoder.convert(response.body);
    debugPrint(prettyprint);
  }

  static void prettyprintSring(String text) {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    String prettyprint = encoder.convert(text);
    debugPrint(prettyprint);
  }

  static Map<String, dynamic> getMap(Response response) {
    return jsonDecode(response.bodyString.toString());
    //return json.decode(utf8.decode(response.bodyString!.runes.toList()));
  }

  ///Recupera Pessoa específica
  static String? getToken(Response response) {
    Map<String, dynamic> data = getMap(response);
    String? token = (data['accessToken']);
    return token;
  }

  ///Recupera Pessoa-Lugar específico
  static my.Table? getTable(Response response) {
    Map<String, dynamic> data = getMap(response);
    my.Table? table = my.Table.fromJson(data);
    return table;
  }

  static List<Product> getProductList(Response response) {
    final parsed =
        jsonDecode(response.bodyString.toString()).cast<Map<String, dynamic>>();
    final list = parsed.map<Product>((json) => Product.fromJson(json)).toList();
    return list;
  }

  static List<Ordered> getOrderedList(Response response) {
    final parsed =
        jsonDecode(response.bodyString.toString()).cast<Map<String, dynamic>>();
    final list = parsed.map<Ordered>((json) => Ordered.fromJson(json)).toList();
    return list;
  }

  static List<my.Table> getTableList(Response response) {
    final parsed =
        jsonDecode(response.bodyString.toString()).cast<Map<String, dynamic>>();
    debugPrint("DEBUUUUUG" + parsed.toString());
    final list =
        parsed.map<my.Table>((json) => my.Table.fromJson(json)).toList();
    return list;
  }
}
