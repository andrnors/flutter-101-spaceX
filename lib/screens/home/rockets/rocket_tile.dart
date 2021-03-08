import 'package:flutter/material.dart';
import 'package:rockets/models/rocket.dart';

class RocketTile extends StatelessWidget {
  final Rocket rocket;
  final VoidCallback onTap;

  RocketTile({Key key, @required this.onTap, this.rocket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(6),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Stack(children: [
          Hero(
            tag: 'rocket-image-${rocket.id}',
            child: ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(
                rocket.localImages.first,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
                width: MediaQuery.of(context).size.width - 12,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.zero,
                        topLeft: Radius.zero,
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
                    color: Colors.black.withOpacity(0.7)),
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      rocket.name,
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Text(
                        rocket.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.subtitle2.copyWith(
                          color: Colors.white
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ]),
      ),
    );
  }
}
