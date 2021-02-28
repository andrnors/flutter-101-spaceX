import 'package:flutter/material.dart';
import 'package:rockets/screens/home/rockets/rocket_details_screen.dart';
import 'package:rockets/services/rocket_service.dart';
import 'package:provider/provider.dart';
import 'rocket_list_tile.dart';

class RocketList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: context.read<RocketService>().getRockets(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('An error occured! 😭');
          } else if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(backgroundColor: Colors.orange),
            );
          } else {
            final rockets = snapshot.data;
            return ListView.builder(
                itemCount: rockets.length,
                itemBuilder: (context, index) {
                  return RocketListTile(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return RocketDetailsScreen(rocket: rockets[index]);
                      }));
                    },
                    rocket: rockets[index],
                  );
                });
          }
        },
      ),
    );
  }
}
