import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseConnect extends GetConnect {
  @override
  void onInit() async {
    Get.log('Base Connect Inicializado');

    //URL base
    //httpClient.baseUrl = 'http://localhost:8080';
    httpClient.baseUrl = 'https://le-menu-lab.herokuapp.com';
    httpClient.addResponseModifier((request, response) async {
      debugPrint(request.method);
      debugPrint('${request.url}');

      return response;
    });

    // Json Content Type
    httpClient.defaultContentType = 'application/json; charset=utf-8';

    //Tempo de duração das requisições
    httpClient.timeout = const Duration(seconds: 15);

    //Em caso de falha, número de tentativas
    httpClient.maxAuthRetries = 2;
  }
}
