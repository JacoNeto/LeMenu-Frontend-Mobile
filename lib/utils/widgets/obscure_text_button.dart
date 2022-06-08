import 'package:flutter/material.dart';

class ObscureTextButton extends StatelessWidget {
  const ObscureTextButton(
      {Key? key, required this.passwordVisible, required this.onPressed})
      : super(key: key);

  final bool passwordVisible;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        // Based on passwordVisible state choose the icon
        passwordVisible ? Icons.visibility_off : Icons.visibility,
        color: Colors.grey,
      ),
      onPressed: onPressed,
    );
  }
}
