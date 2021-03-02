import 'package:flutter/material.dart';
import 'package:rockets/models/rocket.dart';

class RocketListTile extends StatelessWidget {
  final VoidCallback onTap;
  final Rocket rocket;

  RocketListTile({
    Key key,
    @required this.onTap,
    @required this.rocket,
  })
      : assert(onTap != null),
        assert(rocket != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      onTap: onTap,
      leading: rocket.flickrImages.isEmpty
          ? null
          : Hero(
            tag: 'rocket-image-${rocket.id}',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: AspectRatio(
                  aspectRatio: 3 / 2,
                  child: Image.asset(rocket.localImages.first, fit: BoxFit.cover,)),
            ),
          ),
      title: Text(rocket.name),
      subtitle: Text(
        rocket.description,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: const Icon(Icons.chevron_right_sharp),
    );
  }
}
