import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/widgets.dart';
import 'package:flutter_application_1/services/auth_request.dart';

class RecoveryPW2 extends StatefulWidget {
  const RecoveryPW2({super.key});

  @override
  State<RecoveryPW2> createState() => _RecoveryPW2State();
}

class _RecoveryPW2State extends State<RecoveryPW2> {
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final dynamic args = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Recuperar contraseña"),
            Image.asset(
              "assets/images/mini_logo.png",
              width: 70,
              height: 70,
            ),
          ],
        ),
        backgroundColor: const Color(0xff48197c),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Text(
                            "Por seguridad, tu contraseña debe contener una longitud de entre 8 y 15 caracteres,usar mayúsculas, minúsculas, contener por lo menos un número especial y un carácter especial.",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color.fromARGB(255, 113, 113, 113),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 30, bottom: 5),
                          child: Text(
                            "Nueva contraseña",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        TextField(
                          controller: passController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            hintText: ('Nueva contraseña'),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 30, bottom: 5),
                          child: Text(
                            "Confirmar nueva contraseña",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        TextField(
                          controller: confirmPassController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            hintText: ('Confirmar nueva contraseña'),
                          ),
                        ),
                        update_password(context, args),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Padding update_password(BuildContext context, args) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: SizedBox(
        width: double.infinity,
        height: 45,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: (RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            )),
            side: const BorderSide(
              width: 2,
              color: Colors.green,
            ),
          ),
          child: const Text(
            "Actualizar contraseña",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            if (passController.text == confirmPassController.text) {
              resetPassword(context, args, passController.text);
            } else {
              alert(context, 'Verifica los campos',
                  'Las contraseñas no son iguales');
            }
          },
        ),
      ),
    );
  }
}
