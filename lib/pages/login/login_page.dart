import 'package:flutter/material.dart';
import 'package:le_menu_mobile/pages/login/components/login_form.dart';
import 'package:le_menu_mobile/utils/widgets/text_logo.dart';

import '../../utils/widgets/logo.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login do Atendente")),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              height: 100,
            ),
            Logo(),
            SizedBox(
              height: 20,
            ),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
