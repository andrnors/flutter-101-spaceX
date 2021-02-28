import 'package:flutter/material.dart';
import 'package:rockets/services/rocket_service.dart';

import 'app/app.dart';

void main() {
  final rocketService = RocketService(apiUrl: 'https://api.spacexdata.com/v4');
  // timeDilation = 2.0;

  runApp(RocketApp(rocketService: rocketService));
}


