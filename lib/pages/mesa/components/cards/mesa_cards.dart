import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:le_menu_mobile/utils/my_colors.dart';

import '../../../../controllers/cardapio_controller.dart';
import 'components/mesa_card_model.dart';

class MesaCards extends StatelessWidget {
  MesaCards({Key? key}) : super(key: key);
  final CardapioController cardapioController = Get.find();
  @override
  Widget build(BuildContext context) {
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
                  itemCount: cardapioController.selected.value,
                  itemBuilder: (context, index) {
                    return MesaCardModel(
                      product: cardapioController.added[index],
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
