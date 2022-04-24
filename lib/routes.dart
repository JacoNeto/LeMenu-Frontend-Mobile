import 'package:flutter/material.dart';
import 'package:le_menu_mobile/pages/home/components/qr_code.dart';

import 'pages/cardapio/cardapio_page.dart';
import 'pages/home/home_page.dart';
import 'pages/mesa/mesa_page.dart';
import 'pages/name/name_info_page.dart';
import 'pages/result/result.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      // main page routes
      case '/':
        return MaterialPageRoute(
            builder: (_) => MyHomePage(
                  title: "teste",
                ));
      case '/qrcode':
        return MaterialPageRoute(builder: (_) => const QRCodePage());
      case '/nameinfo':
        return MaterialPageRoute(builder: (_) => NameInfoPage());
      case '/cardapio':
        return MaterialPageRoute(builder: (_) => const CardapioPage());
      case '/mesa':
        return MaterialPageRoute(builder: (_) => const MesaPage());
      case '/resultado':
        return MaterialPageRoute(builder: (_) => ResultPage());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
