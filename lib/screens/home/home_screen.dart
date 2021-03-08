import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Todo: Add  ann appBar to the Scaffold Widget with the title 'Rocket Guide'
    return Scaffold(

        // Todo: Replace the Center and Text Widget with the RocketList
        body: Center(
      child: Text(
        'Hello Online! 🚀',
        style: TextStyle(fontSize: 30),
      ),
    ));
  }
}
