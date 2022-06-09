import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:le_menu_mobile/utils/local_save.dart';

class BaseConnect extends GetConnect {
  @override
  void onInit() async {
    Get.log('Base Connect Inicializado');

    //URL base
    //httpClient.baseUrl = 'http://localhost:8080';
    //httpClient.baseUrl = 'http://192.168.1.108:8080';
    httpClient.baseUrl = 'https://le-menu-lab.herokuapp.com';
    httpClient.addResponseModifier((request, response) async {
      debugPrint(request.method);
      debugPrint('${request.url}');

      return response;
    });

    httpClient.addRequestModifier((Request request) async {
      String token = await LocalSave().read("accessToken");
      token = token.trim().replaceAll("\"", "");
      debugPrint("Chegou aquiiiiiiiiiii!" + token);
      request.headers['Authorization'] = "Bearer $token";

      return request;
    });

    // Json Content Type
    httpClient.defaultContentType = 'application/json; charset=utf-8';

    //Tempo de duração das requisições
    httpClient.timeout = const Duration(seconds: 15);

    //Em caso de falha, número de tentativas
    httpClient.maxAuthRetries = 2;
  }
}
