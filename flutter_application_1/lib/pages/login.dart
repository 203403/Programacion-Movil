import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    padding: const EdgeInsets.only(top: 300),
                    child: Column(children: const [
                      Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: TextField(
                            decoration: InputDecoration(hintText: 'Username'),
                          )),
                      TextField(
                        decoration: InputDecoration(hintText: 'Password'),
                      ),
                    ]),
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
