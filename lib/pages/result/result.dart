import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:le_menu_mobile/utils/my_colors.dart';
import 'package:le_menu_mobile/utils/widgets/buttons/home_button.dart';

import '../../controllers/cardapio_controller.dart';
import '../../utils/widgets/big_text.dart';

class ResultPage extends StatelessWidget {
  ResultPage({Key? key}) : super(key: key);

  final CardapioController cardapioController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                "Obrigado!!! Vá ao caixa para pagar seu pedido",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
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
                  Obx(() => BigText("R\$ ${cardapioController.total.value}")),
                ],
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            HomeButton(
                child: const Text(
                  "Ok",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  cardapioController.clear();
                  Navigator.of(context).pushNamed('/');
                },
                borderColor: colorC2,
                color: colorC2),
          ],
        ),
      ),
    );
  }
}
