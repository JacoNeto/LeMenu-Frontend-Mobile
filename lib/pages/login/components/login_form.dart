import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/login_controller.dart';
import '../../../utils/widgets/obscure_text_button.dart';

/// This Class Contains the Login Form Widget

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final LoginController loginController = Get.put(LoginController());
  final _loginFormKey = GlobalKey<FormState>();

  var _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.only(right: 16.0, left: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildTextFields(),
          Container(
              padding: const EdgeInsets.only(top: 16),
              child: _buildButtons(context)),
        ],
      ),
    );
  }

  Widget _buildTextFields() {
    return Container(
      child: Form(
        key: _loginFormKey,
        child: Column(
          children: [
            // Email Field
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'login';
                }
                return null;
              },
              decoration: const InputDecoration(
                  labelText: 'Login',
                  labelStyle: TextStyle(color: Colors.black)),
              onSaved: (value) {
                loginController.login = value == null ? "" : value.trim();
              },
              textInputAction: TextInputAction.next,
            ),
            // Password Field
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Senha';
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: 'Senha ',
                  labelStyle: const TextStyle(color: Colors.black),

                  // Issue 11
                  // https://gitlab.com/bruno84/gnomon-frontend-urbano/-/issues/11

                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(top: 14.0),
                    child: ObscureTextButton(
                      passwordVisible: _passwordVisible,
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  )),
              obscureText: !_passwordVisible,
              onSaved: (value) {
                loginController.password = value ?? "";
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Obx(() => Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 64),
              child: ConstrainedBox(
                constraints:
                    const BoxConstraints.tightFor(width: 343, height: 40),
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                  ))),
                  child: const Text(
                    'Entrar',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () async {
                    _loginFormKey.currentState!.save();
                    if (_loginFormKey.currentState!.validate()) {
                      await loginController.signin();
                      if (loginController.isLogged) {
                        Navigator.of(context).pushNamed('/atendente');
                      }
                    }
                  },
                ),
              ),
            ),
            if (loginController.error)
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Login ou senha incorretos",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red // easy way to access theme
                      ),
                ),
              ),
            if (loginController.isLoading.value)
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ));
  }
}
