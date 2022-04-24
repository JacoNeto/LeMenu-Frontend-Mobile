import 'package:flutter/material.dart';

import 'components/name_form.dart';
import 'package:get/get.dart';

import '../../../controllers/name_controller.dart';

class NameInfoPage extends StatelessWidget {
  NameInfoPage({Key? key}) : super(key: key);

  final NameController homeController = Get.put(NameController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Back.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(child: NameForm())),
    );
  }
}
