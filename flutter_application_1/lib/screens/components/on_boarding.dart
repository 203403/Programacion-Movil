import 'package:flutter_application_1/screens/components/content_boarding.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentePage = 0;
  late PageController pageController;
  List<Map<String, String>> listBoarding = [
    {
      "titulo": "ESPARCIMIENTO",
      "imagen": "assets/images/B1.png",
      "subtitulo": "Brindamos todos los servicios para consentir a tu mascota"
    },
    {
      "titulo": "ADOPCIÓN",
      "imagen": "assets/images/B2.png",
      "subtitulo":
          "este es un texto que sirve como subtitulo de ejemplo para la vista 2"
    },
    {
      "titulo": "HOSPITALIDAD",
      "imagen": "assets/images/B3.png",
      "subtitulo":
          "este es un texto que sirve como subtitulo de ejemplo para la vista 3"
    },
    {
      "titulo": "VETERINARIA",
      "imagen": "assets/images/B4.png",
      "subtitulo":
          "este es un texto que sirve como subtitulo de ejemplo para la vista 4"
    },
    {
      "titulo": "TIENDA",
      "imagen": "assets/images/B5.png",
      "subtitulo":
          "este es un texto que sirve como subtitulo de ejemplo para la vista 5"
    },
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          slider(),
          paginator(),
          customButton(),
        ],
      ),
    );
  }

  Expanded slider() {
    return Expanded(
      flex: 10,
      child: PageView.builder(
        itemBuilder: (context, index) => ContentBoarding(
          titulo: listBoarding[index]['titulo'],
          subtitulo: listBoarding[index]['subtitulo'],
          image: listBoarding[index]['imagen'],
        ),
        itemCount: listBoarding.length,
        controller: pageController,
        onPageChanged: (value) {
          setState(() {
            currentePage = value;
          });
        },
      ),
    );
  }

  Expanded paginator() {
    return Expanded(
      flex: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          listBoarding.length,
          (index) => AnimatedContainer(
            duration: kThemeAnimationDuration,
            height: currentePage == index ? 7 : 5,
            width: currentePage == index ? 30 : 20,
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: currentePage == index
                    ? const Color(0xfffc1360)
                    : const Color(0xffe0e0e0)),
          ),
        ),
      ),
    );
  }

  Expanded customButton() {
    return Expanded(
      flex: 2,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SizedBox(
            width: double.infinity,
            height: 60,
            child: OutlinedButton(
              onPressed: () async {
                currentePage == listBoarding.length - 1
                    ? Navigator.pushReplacementNamed(context, '/homepage')
                    : pageController.nextPage(
                        curve: Curves.easeInSine,
                        duration: const Duration(milliseconds: 300));
              },
              style: OutlinedButton.styleFrom(
                  backgroundColor: currentePage == listBoarding.length - 1
                      ? Colors.green
                      : Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  side: BorderSide(
                      width: 3,
                      color: currentePage == listBoarding.length - 1
                          ? Colors.green
                          : const Color(0xff878787))),
              child: Text(
                currentePage == listBoarding.length - 1
                    ? "Continuar"
                    : "Siguiente",
                style: TextStyle(
                    fontSize: 24,
                    color: currentePage == listBoarding.length - 1
                        ? const Color(0xffffffff)
                        : const Color(0xff878787)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
