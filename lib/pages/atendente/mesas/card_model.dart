import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:le_menu_mobile/pages/atendente/pedidos/pedidos_page.dart';
import 'package:le_menu_mobile/utils/my_colors.dart';
import 'package:le_menu_mobile/utils/widgets/checkbox.dart';
import 'package:le_menu_mobile/models/table/table.dart' as my;

import '../../../../../controllers/cardapio_controller.dart';
import '../../../../../models/product/product.dart';
import '../../../../../utils/widgets/network_image.dart';
import '../../../controllers/atendente_controller.dart';

class CardModel extends StatefulWidget {
  const CardModel({Key? key, required this.table}) : super(key: key);

  final my.Table table;

  @override
  State<CardModel> createState() => _CardModelState();
}

class _CardModelState extends State<CardModel> {
  var selected = false;

  final AtendenteController atendenteController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0, left: 8.0, right: 8.0),
      child: InkWell(
        onTap: () {
          Get.to(PedidosPage(tableId: widget.table.id!));
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    widget.table.code ?? "",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                      onPressed: () {
                        atendenteController.remove(widget.table.id!);
                      },
                      icon: const Icon(
                        Icons.remove_circle,
                        color: Colors.red,
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
