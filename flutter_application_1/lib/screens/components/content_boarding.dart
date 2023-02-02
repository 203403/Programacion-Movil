import 'package:flutter/material.dart';

class ContentBoarding extends StatelessWidget {
  const ContentBoarding({super.key, this.titulo, this.image, this.subtitulo});
  final String? titulo;
  final String? image;
  final String? subtitulo;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: SizedBox(
              width: 200,
              height: 200,
              child: Image.asset(
                image!,
                width: 400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Text(
              titulo!,
              style: const TextStyle(fontSize: 30, color: Color(0xff4a1283)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              subtitulo!,
              style: const TextStyle(fontSize: 20, color: Color(0xff8d8d8d)),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
