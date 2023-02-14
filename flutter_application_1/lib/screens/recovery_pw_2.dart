import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RecoveryPW2 extends StatelessWidget {
  const RecoveryPW2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xffe53863)),
        title: const Text('Recuperar contraseña'),
        elevation: 0,
        leadingWidth: 60,
        titleSpacing: -10,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: SizedBox(
              width: 70,
              child: Image.asset(
                'assets/images/OutsideLogin.png',
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints viewportConstrains) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minHeight: viewportConstrains.maxHeight),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 70),
                          child: Text(
                            "Por tu seguridad, tu contraseña debe tener una longitud "
                            "de entre 8 y 15 caracteres, usar mayúsculas, minúsculas, "
                            "contener por lo menos un número y un carácter especial.",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color(0xff797979)),
                          ),
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Nueva contraseña',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 20.0),
                          child: TextField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xffc1c1c1)),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              hintText: 'Nueva contraseña',
                              hintStyle: const TextStyle(
                                color: Color(0xffc1c1c1),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Confirmar nueva contraseña',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 20.0),
                          child: TextField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xffc1c1c1)),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              hintText: 'Confirmar tú nueva contraseña',
                              hintStyle: const TextStyle(
                                color: Color(0xffc1c1c1),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 300.0, bottom: 20),
                          child: SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: OutlinedButton(
                              onPressed: () async {},
                              style: OutlinedButton.styleFrom(
                                backgroundColor: const Color(0xff80a660),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                              ),
                              child: const Text(
                                "Actualizar contraseña",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
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
}
