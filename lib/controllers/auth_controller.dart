// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:t_action/controllers/popmessages_controller.dart';
import 'package:t_action/controllers/user_controller.dart';
import 'package:t_action/views/GamesRoom/games_room.dart';
import 'package:t_action/views/Login/login_screen.dart';
import 'package:t_action/views/Welcome/welcome_screen.dart';

class AuthController {
  Future<void> signInUser(
      BuildContext context, String email, String password) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        showPopAlert(
          context,
          'Por favor ingrese su email y contraseña',
          AlertMessageType.error,
        );
      } else {
        final FirebaseAuth auth = FirebaseAuth.instance;

        UserCredential userCredential = await auth.signInWithEmailAndPassword(
            email: email, password: password);

        User? user = userCredential.user;
        String uid = user!.uid;
        String? actualUserId = await getUserId();
        if (uid == actualUserId) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const GamesRoom()));
        } else {
          showPopAlert(
              context, 'El usuario no existe', AlertMessageType.warning);
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showPopAlert(
          context,
          'Usuario no encontrado',
          AlertMessageType.warning,
        );
      } else if (e.code == 'wrong-password') {
        showPopAlert(
          context,
          'Contraseña incorrecta',
          AlertMessageType.warning,
        );
      } else if (e.code == 'invalid-email') {
        showPopAlert(
          context,
          'El formato del correo electrónico\nno es válido.',
          AlertMessageType.error,
        );
      } else if (e.code == 'user-disabled') {
        showPopAlert(
          context,
          'Su cuenta está deshabilitada.',
          AlertMessageType.error,
        );
      } else if (e.code == 'network-request-failed') {
        showPopAlert(
          context,
          'Problema de red durante la autenticación.',
          AlertMessageType.error,
        );
      } else if (e.code == 'too-many-requests') {
        showPopAlert(
          context,
          'Demasiadas solicitudes desde el\nmismo dispositivo o IP.',
          AlertMessageType.error,
        );
      } else {
        showPopAlert(context, 'Error al iniciar sesión: ${e.message}',
            AlertMessageType.error);
        print(e.message);
      }
    }
  }

  Future<void> retrieveSession(BuildContext context) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
          // Si el UID del usuario es igual al ownerId, el usuario es un propietario
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const GamesRoom()),
          );
      } else {
        // Si no hay usuario autenticado, redirigir a la pantalla de inicio de sesión
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    } catch (e) {
      print('Error retrieving session: $e');
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      );
    } catch (e) {
      print(e);
    }
  }
}
