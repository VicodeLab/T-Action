import 'package:flutter/material.dart';
import 'package:t_action/controllers/auth_controller.dart';

import '../../../components/constants.dart';
import '../../Signup/signup_screen.dart';

class LoginAndSignupBtn extends StatelessWidget {
  const LoginAndSignupBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: "login_btn",
          child: ElevatedButton(
            onPressed: () {
              AuthController().retrieveSession(context);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor, elevation: 6),
            child: Text(
              "Ingresar".toUpperCase(),
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const SignUpScreen();
                },
              ),
            );
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryLightColor, elevation: 6),
          child: Text(
            "Crear usuario".toUpperCase(),
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
