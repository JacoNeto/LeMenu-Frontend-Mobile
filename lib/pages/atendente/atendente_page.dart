import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:le_menu_mobile/pages/atendente/mesas/cards.dart';
import 'package:le_menu_mobile/models/table/table.dart' as my;

import '../../controllers/atendente_controller.dart';

class AtendentePage extends StatelessWidget {
  AtendentePage({Key? key}) : super(key: key);

  final atendenteController = Get.put(AtendenteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mesas")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<my.Table>?>(
            future: atendenteController.getAll(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return const Text('Algo deu errado');
                } else if (snapshot.hasData) {
                  return Cards(tables: snapshot.data!);
                } else {
                  return const Text('Nada aqui ainda');
                }
              } else {
                return Text('State: ${snapshot.connectionState}');
              }
            }),
      ),
    );
  }
}
