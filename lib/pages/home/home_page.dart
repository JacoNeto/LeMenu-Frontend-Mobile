import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:le_menu_mobile/utils/my_colors.dart';

import '../../controllers/home_controller.dart';
import 'components/home_form.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/Back.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(child: HomeForm())),
      ),
    );
  }
}
