import 'package:flutter/material.dart';
import 'package:le_menu_mobile/pages/cardapio/components/cards/components/card_model.dart';
import 'package:le_menu_mobile/utils/my_colors.dart';

import '../../../../models/product/product.dart';

class Cards extends StatelessWidget {
  const Cards({Key? key, required this.products}) : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorW3,
      child: Scrollbar(
        isAlwaysShown: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return CardModel(
                      product: products[index],
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
