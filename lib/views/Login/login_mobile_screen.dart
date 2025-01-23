import 'package:flutter/material.dart';
import 'package:t_action/components/already_have_an_account_acheck.dart';
import 'package:t_action/components/constants.dart';
import 'package:t_action/controllers/auth_controller.dart';
import 'package:t_action/views/Login/components/login_screen_top_image.dart';
import 'package:t_action/views/Signup/signup_screen.dart';

class MobileLoginScreen extends StatefulWidget {
  const MobileLoginScreen({super.key});

  @override
  State<MobileLoginScreen> createState() => _MobileLoginScreenState();
}

class _MobileLoginScreenState extends State<MobileLoginScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final bool isEmailValid = false;
  final bool isPasswordValid = false;

  String get email => emailController.text.trim();
  String get password => passwordController.text.trim();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const LoginScreenTopImage(),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: Form(
                        child: SingleChildScrollView(
                          reverse: true,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: emailController,
                                keyboardType: TextInputType.name,
                                textInputAction: TextInputAction.next,
                                cursorColor: kPrimaryColor,
                                decoration: InputDecoration(
                                  errorText: isEmailValid
                                      ? null
                                      : 'Correo electrónico inválido',
                                  hintText: "Correo",
                                  prefixIcon: const Padding(
                                    padding: EdgeInsets.all(defaultPadding),
                                    child: Icon(Icons.person),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: defaultPadding),
                                child: TextFormField(
                                  controller: passwordController,
                                  textInputAction: TextInputAction.done,
                                  obscureText: true,
                                  cursorColor: kPrimaryColor,
                                  decoration: InputDecoration(
                                    errorText: isPasswordValid
                                        ? null
                                        : 'Contraseña inválida',
                                    hintText: "Contraseña",
                                    prefixIcon: const Padding(
                                      padding: EdgeInsets.all(defaultPadding),
                                      child: Icon(Icons.lock),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: defaultPadding),
                              Hero(
                                tag: "login_btn",
                                child: ElevatedButton(
                                  onPressed: (){
                                    AuthController().signInUser(context, email, password);
                                  },
                                  child: Text(
                                    "Ingresar".toUpperCase(),
                                  ),
                                ),
                              ),
                              const SizedBox(height: defaultPadding),
                              AlreadyHaveAnAccountCheck(
                                press: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const SignUpScreen();
                                      },
                                    ),
                                  );
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom),
                              )
                            ],
                          ),
                        ),
                      ),
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}
