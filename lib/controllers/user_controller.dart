// ignore_for_file: use_build_context_synchronously
//FUNCIONA BIEN

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:t_action/controllers/base_controller.dart';
import 'package:t_action/controllers/popmessages_controller.dart';
import 'package:t_action/models/user_model.dart';
import 'package:t_action/views/Login/login_screen.dart';

Future<String?> getUserName() async {
  try {
    final User user = FirebaseAuth.instance.currentUser!;

    final uid = user.uid;

    final userDoc =
        await FirebaseFirestore.instance.collection('niños').doc(uid).get();

    if (userDoc.exists) {
      final userName = userDoc.data()?['name'];
      return userName as String;
    }
    return null;
  } catch (e) {
    throw Exception('No se pudo obtener el nombre del niño.');
  }
}

Future<String?> getUserId() async {
  try {
    final User user = FirebaseAuth.instance.currentUser!;

    final uid = user.uid;

    final userDoc =
        await FirebaseFirestore.instance.collection('niños').doc(uid).get();

    if (userDoc.exists) {
      final userIdCurrent = userDoc.data()?['id'];
      return userIdCurrent as String;
    }
    return null;
  } catch (e) {
    throw Exception('No se pudo obtener el identificador del usuario.');
  }
}


void registroNtea(
  BuildContext context,
  String ntea,
  String edad,
  String email,
  String password,
  String passwordreply,
) async {
  try {
    if (ntea.isEmpty ||
        edad.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        passwordreply.isEmpty) {
      showPopAlert(context, 'Debe completar todos los campos',
          AlertMessageType.warning);
    } else {
      bool isEmailValid = AuxController.validEmail(email);
      bool isPasswordValid = AuxController.validPasswords(password, passwordreply);

      if (isEmailValid && isPasswordValid) {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        String idUser = userCredential.user!.uid;

        Ntea usuario = Ntea(
          id: idUser,
          name: ntea,
          edad: edad,
          email: email,
        );

        await FirebaseFirestore.instance
            .collection('niños')
            .doc(idUser)
            .set(usuario.toJson());

        showPopAlert(
            context, "Registro exitoso", AlertMessageType.notification);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }else{
        showPopAlert(context, "Las contraseñas no coinciden", AlertMessageType.error);
      }
    }
  } catch (e) {
    if (e is FirebaseAuthException) {
      showPopAlert(
          context,
          'Error al registrar al usuario: ${e.message}',
          AlertMessageType.error);
    } else {
      showPopAlert(
          context, 'Error al registrar al usuario: $e', AlertMessageType.error);
    }
  }
}
