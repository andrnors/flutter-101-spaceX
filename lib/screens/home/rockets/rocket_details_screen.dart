import 'package:flutter/material.dart';
import 'package:rockets/models/rocket.dart';
import 'package:url_launcher/url_launcher.dart';

class RocketDetailsScreen extends StatelessWidget {
  final Rocket rocket;

  RocketDetailsScreen({Key key, @required this.rocket})
      : assert(rocket != null),
        super(key: key);

  bool get _hasAlreadyFlown =>
      rocket?.firstFlight?.isBefore(DateTime.now()) ?? false;

  int get _daysSinceFirstFlight =>
      rocket?.firstFlight?.difference(DateTime.now())?.abs()?.inDays ?? 1;

  String get _firstFlightLabel {
    final date = rocket.firstFlight;
    return '${date.day}-${date.month}-${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(rocket.name),
      ),
      body: ListView(
        children: [
          if (rocket.flickrImages.isNotEmpty) _ImageHeader(rocket: rocket),
          ListTile(
            title: Text(
              rocket.name,
              style: textTheme.headline6,
            ),
            subtitle: rocket.active ? null : Text('Inactive'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              rocket.description,
              style: textTheme.subtitle2,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today_sharp),
            title: Text(_hasAlreadyFlown
                ? '$_daysSinceFirstFlight days since first flight'
                : '$_daysSinceFirstFlight days until first flight'),
            subtitle: Text(_firstFlightLabel),
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
            title: Text('${rocket.height} m'),
            subtitle: const Text('in height'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.arrow_downward_sharp),
            title: Text('${rocket.mass} kg'),
            subtitle: Text('total mass'),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 56,
            child: ElevatedButton(
                onPressed: () {
                  launch(rocket.wikipedia);
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

  _ImageHeader({Key key, @required this.rocket})
      : assert(rocket != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Hero(
        tag: 'rocket-image-${rocket.id}',
        child: PageView(
          children: [
            for (final url in rocket.localImages)
              Image.asset(url, fit: BoxFit.cover)
          ],
        ),
      ),
    );
  }
}
