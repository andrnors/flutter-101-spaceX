import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rockets/app/theme.dart';
import 'package:rockets/models/crew_member.dart';
import 'package:rockets/models/rocket.dart';
import 'package:rockets/screens/home/home_screen.dart';
import 'package:rockets/services/rocket_service.dart';

class RocketApp extends StatelessWidget {

  final RocketService rocketService;


  RocketApp({@required this.rocketService}) : assert(rocketService != null);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider<List<Rocket>>.value(value: rocketService.getRockets()),
        FutureProvider<List<CrewMember>>.value(value: rocketService.getCrewMembers()),
        Provider.value(value: rocketService)
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          home: HomeScreen()
      ),
    );
  }
}