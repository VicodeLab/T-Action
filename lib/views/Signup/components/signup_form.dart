
import 'package:flutter/material.dart';
import 'package:t_action/controllers/base_controller.dart';
import 'package:t_action/controllers/user_controller.dart';
import 'package:t_action/views/Login/login_screen.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../components/constants.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm>{

  final TextEditingController userName = TextEditingController();
  final TextEditingController edad = TextEditingController();
  final TextEditingController correo = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController passwordreply = TextEditingController();

  bool isPasswordValid = true;

  void _validatePassword(String password) {
    setState(() {
      isPasswordValid = AuxController().passwordChecking(password);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      child: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            TextFormField(
              controller: userName,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Nombre",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.person),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: TextFormField(
                controller: edad,
                textInputAction: TextInputAction.done,
                cursorColor: kPrimaryColor,
                decoration: const InputDecoration(
                  hintText: "Edad",
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.numbers),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: TextFormField(
                controller: correo,
                textInputAction: TextInputAction.done,
                cursorColor: kPrimaryColor,
                decoration: const InputDecoration(
                  hintText: "Correo electrónico",
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.email),
                  ),
                ),
              ),
            ),

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                  child: TextFormField(
                    controller: password,
                    onChanged: _validatePassword,
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    cursorColor: kPrimaryColor,
                    decoration: const InputDecoration(
                      hintText: "Contraseña",
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(defaultPadding),
                        child: Icon(Icons.lock),
                      ),
                    ),
                  ),
                ),
                if (!isPasswordValid)
                    const Padding(
                      padding: EdgeInsets.all(
                          8), // Ajusta el margen del mensaje de error
                      child: Text(
                        'Contraseña no válida, debe contener al menos 10 caracteres, incluyendo al menos una letra mayúscula, una minúscula y un número',
                        textAlign: TextAlign.justify,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
              ],
            ),

             Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: TextFormField(
                controller: passwordreply,
                obscureText: true,
                textInputAction: TextInputAction.done,
                cursorColor: kPrimaryColor,
                decoration: const InputDecoration(
                  hintText: "Confirmar contraseña",
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.lock),
                  ),
                ),
              ),
            ),

            const SizedBox(height: defaultPadding ),
            ElevatedButton(
              onPressed: (){
                registroNtea(
                  context,
                  userName.text,
                  edad.text,
                  correo.text,
                  password.text,
                  passwordreply.text
                );
              },
              child: Text("Registrarse".toUpperCase(), style: const TextStyle(color: Colors.black),),
            ),

            const SizedBox(height: defaultPadding),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginScreen();
                    },
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
            )
          ],
        ),
      ),
    );
  }
}