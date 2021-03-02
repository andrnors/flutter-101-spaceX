import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rockets/models/crew_member.dart';

import 'crew_member_details.dart';
import 'crew_tile.dart';

class CrewMemberList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final crewMembers = Provider.of<List<CrewMember>>(context) ?? [];
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Wrap(
          children: [
            for (final member in crewMembers)
              CrewMemberTile(
                  crewMember: member,
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return CrewMemberDetails(member: member);
                    }));
                  }),
          ],
        ));
  }
}
