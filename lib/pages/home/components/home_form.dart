import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:le_menu_mobile/controllers/home_controller.dart';
import 'package:le_menu_mobile/utils/my_colors.dart';

import '../../../utils/widgets/buttons/home_button.dart';
import '../../../utils/widgets/text_logo.dart';

class HomeForm extends StatelessWidget {
  HomeForm({Key? key}) : super(key: key);

  final HomeController homeController = Get.find();
  final _homeFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Future<void> _onPressed() async {
      _homeFormKey.currentState!.save();
      if (_homeFormKey.currentState!.validate()) {
        if (homeController.code == "atendente") {
          Navigator.of(context).pushNamed('/login');
        } else {
          await homeController.open();

          if (!homeController.error) {
            Navigator.of(context).pushNamed('/nameinfo');
          }
        }
      }
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _homeFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextLogo(),
            const SizedBox(
              height: 32,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe a mesa';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: "Código da Mesa",
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(),
                //fillColor: Colors.green
              ),
              onSaved: (value) {
                homeController.code = value == null ? "" : value.trim();
              },
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HomeButton(
                  onPressed: () => Navigator.of(context).pushNamed('/qrcode'),
                  child: Icon(
                    Icons.qr_code,
                    color: colorC1,
                    size: 30,
                  ),
                  color: Colors.white,
                  borderColor: colorC1,
                ),
                Obx(() => homeController.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : HomeButton(
                        onPressed: _onPressed,
                        child: const Text(
                          "Liberar Mesa",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        color: colorC1,
                        borderColor: colorC1,
                      )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
