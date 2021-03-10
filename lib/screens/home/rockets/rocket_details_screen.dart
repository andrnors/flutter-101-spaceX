import 'package:flutter/material.dart';
import 'package:rockets/models/rocket.dart';
import 'package:url_launcher/url_launcher.dart';

class RocketDetailsScreen extends StatelessWidget {
  final Rocket rocket;

  RocketDetailsScreen({Key? key, required this.rocket}) : super(key: key);

  // This is how a getter is defined in Dart. We have defined it as an arrow function
  // since it is only one line. This makes it return the value automatically, without the return statement.
  bool get _hasAlreadyFlown => rocket.firstFlight.isBefore(DateTime.now());

  // This is also a getter, but defined as normal function.
  // Try to rewrite it to an arrow function.
  int get _daysSinceFirstFlight {
    return rocket.firstFlight.difference(DateTime.now()).abs().inDays;
  }

  // Here we have multiple lines, and we should use a normal function declaration.
  String get _firstFlightLabel {
    final date = rocket.firstFlight;
    // Todo: Return the date as a string 'dd-mm-yyy'
    return '';
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
          // Todo: Add the rocket name as the title of the AppBar.
          ),
      body: ListView(
        children: [
          _ImageHeader(
              rocket:
                  rocket), // Todo: Finish the implementation of this. (See the private Widget at the end of the file)
          ListTile(
            title: Text(
              // Hint: Use the textTheme defined at the top of the build function
              'Add rocket name here. And style it as a headline6.',
            ),
            // The ? : syntax is a one-line if-statement.
            // If the rocket is active, we return the text Active else we return Inactive.
            subtitle: rocket.active! ? const Text('Active') : const Text('Inactive'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Add the rocket description here and style it as a subtitle2.',
              style: textTheme.subtitle2,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today_sharp),
            title: Text(_hasAlreadyFlown
                ? '$_daysSinceFirstFlight days since first flight'
                : '$_daysSinceFirstFlight days until first flight'),
            subtitle: Text(
                _firstFlightLabel), // Todo: Implement this function so it returns a date label
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.code_sharp),
            title: Text('${rocket.diameter} m'),
            subtitle: const Text('in diameter'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.height_sharp),
            title: null, // Todo: Add a Text with the rocket height.
            subtitle: const Text('in height'),
          ),
          const Divider(),
          ListTile(
              // Todo: Add a leading Icon suitable for describing the mass of the rocket
              // Todo: Add a title Text with the rocket mass in kg. (No math needed)
              // Todo: Add a subtitle Text with the total mass label
              ),
          Container(
            // A container surrounding a button.
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            height: 56,
            // ElevatedButton is a normal button with elevation.
            // It has a callback function called onTap, which is triggered when clicking the button.
            // In the callback function we are calling a launch function. This will open the default browser of the phone.
            child: ElevatedButton(
                onPressed: () {
                  launch(rocket.wikipedia!);
                },
                child: Center(
                  child: Text('View Wikipedia Article'),
                )),
          )
        ],
      ),
    );
  }
}

class _ImageHeader extends StatelessWidget {
  final Rocket rocket;

  _ImageHeader({Key? key, required this.rocket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Todo: Show all the local images in an image carousel view.
    // Hint: Flutter has a widget called PageView which is perfect for this.
    return SizedBox(
        child: Image.asset(rocket.localImages.first, fit: BoxFit.cover));
  }
}
