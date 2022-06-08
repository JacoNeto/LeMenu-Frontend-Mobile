import 'package:flutter/widgets.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage('assets/logo.png'),
      width: 200,
      height: 200,
      semanticLabel: 'logo',
    );
  }
}
