import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:le_menu_mobile/utils/my_colors.dart';

class TextLogo extends StatelessWidget {
  const TextLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("Le Menu",
        style: GoogleFonts.rozhaOne(
            fontSize: 30, color: colorC1, fontWeight: FontWeight.bold));
  }
}
