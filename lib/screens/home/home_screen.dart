
import 'package:flutter/material.dart';

import 'rockets/rocket_list.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ROCKET GUIDE'),
      ),
      body: RocketList()
    );
  }
}
