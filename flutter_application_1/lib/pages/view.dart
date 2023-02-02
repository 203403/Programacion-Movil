import 'package:flutter/material.dart';

class View extends StatelessWidget {
  const View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My vista'),
        ),
        body: const Center(
          child: Text("texto"),
        ));
  }
}
