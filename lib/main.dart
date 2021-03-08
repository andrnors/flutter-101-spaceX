import 'package:flutter/material.dart';
import 'package:rockets/services/rocket_service.dart';

import 'app/app.dart';

void main() {
  final rocketService = RocketService(apiUrl: 'https://api.spacexdata.com/v4');
  // Used to slow down all animations globally
  // timeDilation = 2.0;  //remember to import 'package:flutter/scheduler.dart'

  runApp(RocketApp(rocketService: rocketService));
}


