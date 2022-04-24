import 'package:flutter/material.dart';
import 'package:le_menu_mobile/utils/my_colors.dart';

class HomeButton extends StatelessWidget {
  const HomeButton(
      {Key? key,
      required this.child,
      required this.onPressed,
      required this.borderColor,
      required this.color})
      : super(key: key);

  final Widget child;
  final Function()? onPressed;
  final Color borderColor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        width: 150,
        child: ElevatedButton(
          child: child,
          onPressed: onPressed,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(color),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: borderColor)))),
        ));
  }
}
