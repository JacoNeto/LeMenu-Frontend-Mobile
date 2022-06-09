import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:le_menu_mobile/controllers/home_controller.dart';
import 'package:le_menu_mobile/utils/my_colors.dart';
import 'package:le_menu_mobile/utils/widgets/checkbox.dart';

import '../../../../../controllers/cardapio_controller.dart';
import '../../../../../models/product/product.dart';
import '../../../../../utils/widgets/network_image.dart';
import '../../../models/ordered/ordered.dart';

class PedidosCard extends StatefulWidget {
  const PedidosCard({Key? key, required this.product, required this.ordered})
      : super(key: key);

  final Product product;
  final Ordered ordered;

  @override
  State<PedidosCard> createState() => _PedidosCardState();
}

class _PedidosCardState extends State<PedidosCard> {
  var selected = false;

  final CardapioController cardapioController = Get.put(CardapioController());
  final HomeController homeController = Get.find();

  void changeSelect() {
    setState(() {
      selected = !selected;
    });
    selected
        ? cardapioController.select(widget.product)
        : cardapioController.unselect(widget.product);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0, left: 8.0, right: 8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(2),
                width: 70,
                height: 70,
                child: MyNetworkImage(mediaLink: widget.product.image),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.name ?? "",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(widget.product.description ?? ""),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: IconButton(
                          onPressed: () {
                            homeController.removeOrderToTable(widget.ordered);
                          },
                          icon: const Icon(
                            Icons.remove_circle,
                            color: Colors.red,
                          )),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "R\$ ${widget.product.price!.toStringAsFixed(2)}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
