import 'package:flutter/material.dart';

class CheckBox extends StatelessWidget {
  const CheckBox(
      {Key? key,
      required this.onPressed,
      required this.color,
      required this.marked})
      : super(key: key);

  final bool marked;
  final Function() onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Icon(
        marked ? Icons.done : Icons.add,
        color: marked ? Colors.white : color,
      ),
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(marked ? color : Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: color)))),
    );
  }
}
