import 'package:flutter/material.dart';
import 'package:sweaterz_flutter/networking_service/tag_service.dart';
import 'package:sweaterz_flutter/view/screens/components/sports_button.dart';

class SportsFollowsListWidget extends StatelessWidget {
  const SportsFollowsListWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
        future: Future.wait([
          TagService().getAllSports(),
          TagService().getFollowingSports(),
        ]),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List sportsList = snapshot.data[0];
            List followingSportsList = snapshot.data[1];
            List<Widget> sportsButtonList = [];
            for (Map map in sportsList) {
              bool _isActivated = false;
              if (followingSportsList.contains(map['name'])) {
                _isActivated = true;
              }
              sportsButtonList.add(
                SportsButton(
                  sportsName: map['name'],
                  isActivated: _isActivated,
                  activatedCallback: () {
                    TagService().followsSport({'name': map['name']});
                  },
                  deactivatedCallback: () {
                    TagService().unfollowsSport({'name': map['name']});
                  },
                ),
              );
            }
            return Wrap(
              spacing: 5.0,
              runSpacing: 1.0,
              children: sportsButtonList,
            );
          } else if (snapshot.hasError) {
            return Text('error');
          } else {
            return Text('loading');
          }
        });
  }
}
