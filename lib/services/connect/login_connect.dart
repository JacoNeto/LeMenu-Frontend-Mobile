import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/json_utils.dart';
import '../../utils/local_save.dart';

class LoginConnect extends GetConnect {
  @override
  void onInit() async {
    Get.log('Base Connect Inicializado');

    //URL base
    httpClient.baseUrl = 'https://le-menu-lab.herokuapp.com';
    httpClient.addResponseModifier((request, response) async {
      debugPrint(request.method);
      debugPrint('${request.url}');

      var token = JsonUtils.getToken(response);
      await LocalSave().save("accessToken", token);

      return response;
    });

    // Json Content Type
    httpClient.defaultContentType = 'application/json; charset=utf-8';

    //Tempo de duração das requisições
    httpClient.timeout = const Duration(seconds: 15);

    //Em caso de falha, número de tentativas
    httpClient.maxAuthRetries = 2;
  }

  // Login
  Future<Response> login(String login, String senha) async {
    Get.log('Login Connect');
    var map = <String, String>{"login": login, "password": senha};
    final response = await post('/login', map);

    return response;
  }
}
