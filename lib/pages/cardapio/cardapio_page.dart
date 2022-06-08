import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:le_menu_mobile/controllers/home_controller.dart';
import 'package:le_menu_mobile/models/product/product.dart';
import 'package:le_menu_mobile/pages/cardapio/components/cards/cards.dart';
import 'package:le_menu_mobile/utils/my_colors.dart';
import 'package:le_menu_mobile/utils/widgets/buttons/home_button.dart';

import '../../controllers/cardapio_controller.dart';
import '../../controllers/cart_controller.dart';
import '../../utils/widgets/big_text.dart';

class CardapioPage extends StatelessWidget {
  const CardapioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CardapioController cardapioController = Get.put(CardapioController());
    final CartController cartController = Get.put(CartController());

    return Scaffold(
      body: FutureBuilder<List<Product>?>(
          future: cardapioController.getAll(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              children: [
                Expanded(flex: 14, child: Cards(products: snapshot.data!)),
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
                              onPressed: () async {
                                await cartController.close();
                                Navigator.of(context).pushNamed('/');
                              },
                              child: const Text(
                                "Descartar",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 18),
                              )),
                          Obx(() => cardapioController.selected.value >= 1
                              ? Obx(() => cardapioController.isLoading.value
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : HomeButton(
                                      onPressed: () async {
                                        Navigator.of(context)
                                            .pushNamed('/mesa');
                                      },
                                      color: colorC2,
                                      borderColor: colorC2,
                                      child: const Text(
                                        "Pedir",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                    ))
                              : const SizedBox.shrink()),
                        ],
                      ),
                    ))
              ],
            );
          }),
    );
  }
}
