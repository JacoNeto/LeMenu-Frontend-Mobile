import 'package:flutter/material.dart';
import 'package:le_menu_mobile/pages/cardapio/components/cards/components/card_model.dart';
import 'package:le_menu_mobile/utils/my_colors.dart';

class Cards extends StatelessWidget {
  const Cards({Key? key}) : super(key: key);

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
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return const CardModel(
                      image: null,
                      description:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec convallis erat eget mi',
                      price: 20,
                      title: 'Alimento Gostoso',
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
