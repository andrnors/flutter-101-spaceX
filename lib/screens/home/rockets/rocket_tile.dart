import 'package:flutter/material.dart';
import 'package:rockets/models/rocket.dart';

class RocketTile extends StatelessWidget {
  final Rocket rocket;
  final VoidCallback onTap;

  RocketTile({Key? key, required this.onTap, required this.rocket})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Text(rocket.name ?? ''),
      ),
    );
  }
}
