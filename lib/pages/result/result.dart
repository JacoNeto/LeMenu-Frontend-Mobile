import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:le_menu_mobile/controllers/cart_controller.dart';
import 'package:le_menu_mobile/utils/my_colors.dart';
import 'package:le_menu_mobile/utils/widgets/buttons/home_button.dart';

import '../../controllers/cardapio_controller.dart';
import '../../controllers/name_controller.dart';
import '../../utils/widgets/big_text.dart';

class ResultPage extends StatelessWidget {
  ResultPage({Key? key}) : super(key: key);

  final CardapioController cardapioController = Get.find();
  final CartController cartController = Get.find();
  final NameController nameController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Obrigado, ${nameController.name}!!! Vá ao caixa para pagar seu pedido",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Obx(() => BigText(
                      "${cardapioController.selected.value} ${cardapioController.selected.value == 1 ? "Selecionado" : "Selecionados"}")),
                  Obx(() => BigText(
                      "R\$ ${cardapioController.total.value.toStringAsFixed(2)}")),
                ],
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            Obx(() => cartController.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : HomeButton(
                    child: const Text(
                      "Ok",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      cardapioController.clear();
                      await cartController.close();

                      if (!cartController.error) {
                        Navigator.of(context).pushNamed('/');
                      }
                    },
                    borderColor: colorC2,
                    color: colorC2)),
          ],
        ),
      ),
    );
  }
}
