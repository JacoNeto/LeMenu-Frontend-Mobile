import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:le_menu_mobile/app.dart';

void main() {
  // transparent appbar
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}
