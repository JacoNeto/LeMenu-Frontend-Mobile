import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:le_menu_mobile/utils/my_colors.dart';
import 'package:le_menu_mobile/utils/widgets/buttons/home_button.dart';

import '../../controllers/cardapio_controller.dart';
import '../../controllers/cart_controller.dart';
import '../../utils/widgets/big_text.dart';
import 'components/cards/mesa_cards.dart';

class MesaPage extends StatelessWidget {
  const MesaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());
    final CardapioController cardapioController = Get.find();

    return Scaffold(
      body: Column(
        children: [
          Expanded(flex: 14, child: MesaCards()),
          Expanded(
              flex: 1,
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Obx(() => BigText(
                        "${cardapioController.selected.value} ${cardapioController.selected.value == 1 ? "Selecionado" : "Selecionados"}")),
                    Obx(() => BigText(
                        "R\$ ${cardapioController.total.value.toStringAsFixed(2)}")),
                  ],
                ),
              )),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Voltar",
                          style: TextStyle(color: Colors.red, fontSize: 18),
                        )),
                    Obx(() => cardapioController.selected.value >= 1
                        ? HomeButton(
                            onPressed: () =>
                                Navigator.of(context).pushNamed('/resultado'),
                            color: colorC2,
                            borderColor: colorC2,
                            child: const Text(
                              "Concluir",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          )
                        : const SizedBox.shrink()),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
