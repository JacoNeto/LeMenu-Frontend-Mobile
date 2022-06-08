import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:le_menu_mobile/controllers/cart_controller.dart';
import 'package:le_menu_mobile/models/product/product.dart';
import 'package:le_menu_mobile/utils/my_colors.dart';

import '../../../../controllers/cardapio_controller.dart';
import '../../../../controllers/home_controller.dart';
import 'components/mesa_card_model.dart';

class MesaCards extends StatelessWidget {
  MesaCards({Key? key}) : super(key: key);
  final CardapioController cardapioController = Get.find();
  final CartController cartController = Get.find();
  final HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>?>(
        future: cartController.getOrdered(homeController.id),
        builder: (context, snapshot) {
          if (!(snapshot.connectionState == ConnectionState.done)) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return const Center(
              child: Text("nada aqui ainda"),
            );
          }
          return Container(
            color: colorW3,
            child: Scrollbar(
              thumbVisibility: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return MesaCardModel(
                            product: snapshot.data![index],
                          );
                        }
                        /*itemCount: cardapioController.selected.value,
                        itemBuilder: (context, index) {
                          return MesaCardModel(
                            product: cardapioController.added[index],
                          );
                        }*/
                        )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
