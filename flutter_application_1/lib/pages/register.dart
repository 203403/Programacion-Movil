import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

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
                    padding: const EdgeInsets.only(top: 50),
                    child: Column(children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: TextField(
                          decoration: InputDecoration(hintText: 'Last name'),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: TextField(
                          decoration: InputDecoration(hintText: 'Firts name'),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: TextField(
                          decoration: InputDecoration(hintText: 'Username'),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: TextField(
                          decoration: InputDecoration(hintText: 'Email'),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: TextField(
                          decoration: InputDecoration(hintText: 'Password'),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: TextField(
                          decoration:
                              InputDecoration(hintText: 'Confirm Password'),
                        ),
                      ),
                      rowWidget(),
                      OutlinedButton(
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.amber)),
                          onPressed: () {},
                          child: const Text("Button"))
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

  Padding rowWidget() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          SizedBox(
            width: 150,
            child: TextField(
              decoration: InputDecoration(hintText: 'Year'),
            ),
          ),
          SizedBox(
            width: 150,
            child: TextField(
              decoration: InputDecoration(hintText: 'Gender'),
            ),
          )
        ],
      ),
    );
  }
}
