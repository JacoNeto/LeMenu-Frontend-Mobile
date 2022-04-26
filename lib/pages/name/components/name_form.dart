import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:le_menu_mobile/controllers/home_controller.dart';
import 'package:le_menu_mobile/utils/widgets/text_logo.dart';

import '../../../controllers/name_controller.dart';
import '../../../utils/my_colors.dart';
import '../../../utils/widgets/buttons/home_button.dart';

class NameForm extends StatelessWidget {
  NameForm({Key? key}) : super(key: key);

  final NameController nameController = Get.find();
  final _nameFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Future<void> _onPressed() async {
      _nameFormKey.currentState!.save();
      if (_nameFormKey.currentState!.validate()) {
        await nameController.newUser();

        if (!nameController.error) {
          Navigator.of(context).pushNamed('/cardapio');
        }
      }
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _nameFormKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const TextLogo(),
          const Icon(Icons.person),
          const SizedBox(
            height: 32,
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Informe seu nome';
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Nome",
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(),
              //fillColor: Colors.green
            ),
            onSaved: (value) {
              nameController.name = value == null ? "" : value.trim();
            },
          ),
          const SizedBox(
            height: 16,
          ),
          Obx(() => nameController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : HomeButton(
                  onPressed: _onPressed,
                  child: const Text(
                    "Confirmar",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  color: colorC2,
                  borderColor: colorC2,
                )),
        ]),
      ),
    );
  }
}
