import 'package:flutter/material.dart';
import 'package:sweaterz_flutter/networking_api/tag_api.dart';
import 'package:sweaterz_flutter/view/screens/components/sports_button.dart';

class SportsFollowsListWidget extends StatelessWidget {
  const SportsFollowsListWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
        future: Future.wait([
          TagAPI().getAllSports(),
          TagAPI().getFollowingSports(),
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
                  enabledCallback: () {
                    // Todo 여기에서 어떤 함수를 집어넣는지에 따라 다른 행동을 할 수 있도록 하고싶음
                    TagAPI().followsSport({'name': map['name']});
                  },
                  disabledCallback: () {
                    TagAPI().unfollowsSport({'name': map['name']});
                  },
                ),
              );
            }
            return Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
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
