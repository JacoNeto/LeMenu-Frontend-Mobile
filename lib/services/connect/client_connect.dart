import 'package:get/get_connect/http/src/response/response.dart';
import 'package:flutter/material.dart';
import 'package:le_menu_mobile/models/client/client_register/client_register.dart';

import '../base_connect.dart';

class ClientConnect extends BaseConnect {
  // Open
  Future<Response> newClient(ClientRegister clientRegister) async {
    debugPrint('Client Connect');
    final response = await post('/client/new', clientRegister.toJson());
    //Get.log(response.body.toString());
    debugPrint(response.body.toString());

    return response;
  }
}
