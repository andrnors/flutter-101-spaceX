import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rockets/services/rocket_service.dart';

class RocketList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Fetches data from RocketService
      future: context.read<RocketService>().getRockets(),
      builder: (context, snapshot) {
        if (snapshot.hasError) { // Check if we encounter any errors while fetching data
          return Center(); // Todo: Add a Text for an error message if fetching data fails
        } else if (!snapshot.hasData) { // While we are loading data
          return Center(); // Todo: Add a loading Widget. TIP: CircularProgressIndicator is really nice for this
        } else {
          // Data is finally ready in the snapshot
          final rockets = snapshot.data;
          // TODO: Iterate through all Rockets and create a RocketTile with the rocket
          // HINT: Leave the onTap-function for the RocketTile as null for now.
          return ListView(children: [

          ]);
        }
      },
    );
  }
}
