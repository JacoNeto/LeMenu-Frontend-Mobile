import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:le_menu_mobile/controllers/cart_controller.dart';
import 'package:le_menu_mobile/models/ordered/ordered.dart';
import 'package:le_menu_mobile/models/product/product.dart';
import 'package:le_menu_mobile/pages/atendente/pedidos/pedidos_card.dart';
import 'package:le_menu_mobile/models/table/table.dart' as my;

class PedidosPage extends StatelessWidget {
  PedidosPage({Key? key, required this.table}) : super(key: key);

  final my.Table table;

  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pedidos - Mesa " + (table.code ?? "")),
      ),
      body: FutureBuilder<List<Ordered>?>(
          future: cartController.getOrdered(table.id!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Text('Algo deu errado');
              } else if (snapshot.hasData) {
                return Scrollbar(
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
                              return PedidosCard(
                                product: snapshot.data![index].product!,
                                ordered: snapshot.data![index],
                                tableId: table.id!,
                              );
                            })
                      ],
                    ),
                  ),
                );
              } else {
                return const Text('Nada aqui ainda');
              }
            } else {
              return Text('State: ${snapshot.connectionState}');
            }
          }),
    );
  }
}
