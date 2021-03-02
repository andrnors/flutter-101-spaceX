import 'package:flutter/material.dart';
import 'package:rockets/models/crew_member.dart';

class CrewMemberTile extends StatelessWidget {
  final CrewMember crewMember;
  final VoidCallback onTap;

  CrewMemberTile({Key key, @required this.crewMember, @required this.onTap})
      : assert(crewMember != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.all(6),
              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Stack(children: [
                ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    crewMember.localImage,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                      width: MediaQuery.of(context).size.width / 2 - 12,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.zero,
                              topLeft: Radius.zero,
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25)),
                          color: Colors.black.withOpacity(0.7)),
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        crewMember.name,
                        softWrap: false,
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Colors.white.withOpacity(0.9), fontSize: 18),
                      )),
                ),
              ]),
            ),
          );
  }
}
