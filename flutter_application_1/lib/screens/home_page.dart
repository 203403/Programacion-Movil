import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Column(
            children: [logo(), loginSN(context), loginRole(context)],
          ),
        ),
      ),
    );
  }

  Expanded logo() {
    return Expanded(
      flex: 4,
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Image.asset('assets/images/logo.png'),
      ),
    );
  }

  Expanded loginSN(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton.icon(
                  label: const Text("Continuan con Google",
                      style: TextStyle(fontSize: 22)),
                  icon: SvgPicture.asset("assets/images/google.svg",
                      color: Colors.white),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xff3f68ec),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                  ),
                  onPressed: () async {},
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton.icon(
                  label: const Text("Continuan con Facebook",
                      style: TextStyle(fontSize: 22)),
                  icon: SvgPicture.asset("assets/images/facebook.svg",
                      color: Colors.white),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xff384e9f),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                  ),
                  onPressed: () async {},
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton.icon(
                label: const Text("Registrarse con e-mail",
                    style: TextStyle(fontSize: 22)),
                icon: const Icon(Icons.email, color: Color(0xff65676e)),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xff65676e),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  side: const BorderSide(width: 3, color: Color(0xff65676e)),
                ),
                onPressed: () async {
                  Navigator.pushNamed(context, '/register');
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded loginRole(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            const Text("Entrar como invitado",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xffe73964))),
            const Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 40),
              child: Text(
                "Entrar como vendedor",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xff80a660)),
              ),
            ),
            loginAC(context)
          ],
        ),
      ),
    );
  }

  static Padding loginAC(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: RichText(
          textWidthBasis: TextWidthBasis.longestLine,
          textAlign: TextAlign.justify,
          text: TextSpan(
            style: const TextStyle(fontSize: 18, color: Colors.black),
            children: [
              const TextSpan(text: "¿Ya tienes una cuenta? "),
              TextSpan(
                text: "Iniciar sesión",
                style: const TextStyle(
                    color: Color(0xffe73863), fontWeight: FontWeight.bold),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    Navigator.pushNamed(context, '/login');
                  },
              ),
            ],
          ),
        ));
  }
}
