import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rockets/services/rocket_service.dart';

import 'rocket_tile.dart';

class RocketList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<RocketService>().getRockets(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Houston we have a problem 👽');
        } else if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          final List rockets = snapshot.data as List;
          return ListView(children: [
            for (final rocket in rockets)
              RocketTile(rocket: rocket, onTap: () {})
          ]);
        }
      },
    );
  }
}
