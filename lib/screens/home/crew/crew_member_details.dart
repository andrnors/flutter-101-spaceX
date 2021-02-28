import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rockets/models/crew_member.dart';
import 'package:url_launcher/url_launcher.dart';

class CrewMemberDetails extends StatelessWidget {
  final CrewMember member;

  const CrewMemberDetails({Key key, @required this.member}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          member.name,
          style: theme.headline5.copyWith(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          _ImageHeader(url: member.image),
          Positioned(
              bottom: 0,
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Container(
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                      backgroundBlendMode: BlendMode.colorBurn,
                      color: Colors.black.withOpacity(0.75)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text('Agency: ', style: theme.subtitle1.copyWith(color: Colors.white)),
                          Text(
                            member.agency,
                            style: theme.subtitle1.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text('Status: ', style: theme.subtitle1.copyWith(color: Colors.white)),
                          Text(member.status, style: theme.subtitle1.copyWith(color: Colors.white)),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                        child: SizedBox(
                          height: 46,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                              child: Text('View Wikipedia Article'),
                              onPressed: () => launch(member.wikipedia)),
                        ),
                      )
                    ],
                  )))
        ],
      ),
    );
  }
}

class _ImageHeader extends StatelessWidget {
  final String url;

  _ImageHeader({@required this.url});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: url,
      child: CachedNetworkImage(
        imageUrl: url,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
