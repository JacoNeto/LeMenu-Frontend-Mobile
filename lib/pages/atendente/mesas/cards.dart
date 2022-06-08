import 'package:flutter/material.dart';
import 'package:le_menu_mobile/utils/my_colors.dart';
import 'package:le_menu_mobile/models/table/table.dart' as my;

import 'card_model.dart';

class Cards extends StatelessWidget {
  const Cards({Key? key, required this.tables}) : super(key: key);

  final List<my.Table> tables;

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
                  itemCount: tables.length,
                  itemBuilder: (context, index) {
                    return CardModel(
                      table: tables[index],
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
