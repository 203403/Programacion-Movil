import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_page.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xffe53863)),
        title: const Text('Regístrate'),
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
                            "Crea una cuenta para empezar a usar la app",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color(0xff797979)),
                          ),
                        ),
                        labelUp("Nombre"),
                        textFieldCustom('Nombre completo'),
                        labelUp('Correo electrónico'),
                        textFieldCustom('Dirección de correo'),
                        labelUp('Contraseña'),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              suffixIcon: const Icon(
                                Icons.visibility,
                                color: Color(0xffc1c1c1),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xffc1c1c1)),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              hintText: 'Contraseña',
                              hintStyle: const TextStyle(
                                color: Color(0xffc1c1c1),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "La contraseña debe de contener caracteres, números"
                            "y símbolos con un mínimo de 6 caracteres",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xffc1c1c1),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Radio(
                                    value: "radio value",
                                    groupValue: "group value",
                                    onChanged: (value) {},
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 330,
                                child: RichText(
                                  textAlign: TextAlign.left,
                                  text: const TextSpan(
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                      children: [
                                        TextSpan(
                                            text:
                                                "Al registrarme, acepto los "),
                                        TextSpan(
                                            text: "términos y condiciones ",
                                            style: TextStyle(
                                                color: Color(0xffee84a1))),
                                        TextSpan(text: "y la "),
                                        TextSpan(
                                            text: "política de privacidad",
                                            style: TextStyle(
                                                color: Color(0xffee84a1))),
                                      ]),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 100.0, bottom: 10),
                          child: SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: OutlinedButton(
                              onPressed: () async {
                                Navigator.pushNamed(context, '/homepage');
                              },
                              style: OutlinedButton.styleFrom(
                                backgroundColor: const Color(0xff80a660),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                              ),
                              child: const Text(
                                "Crear Cuenta",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        HomePage.loginAC(context)
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

  Padding textFieldCustom(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 20.0),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffc1c1c1)),
            borderRadius: BorderRadius.circular(16.0),
          ),
          hintText: text,
          hintStyle: const TextStyle(
            color: Color(0xffc1c1c1),
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Align labelUp(String text) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
