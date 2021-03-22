import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sweaterz_flutter/networking_api/tag_api.dart';
import 'package:sweaterz_flutter/view/screens/components/rounded_color_button.dart';

import 'components/sports_button.dart';

class PostSportsAddScreen extends StatefulWidget {
  final List<String> addedSportsList;

  PostSportsAddScreen({this.addedSportsList});

  @override
  _PostSportsAddScreenState createState() => _PostSportsAddScreenState();
}

class _PostSportsAddScreenState extends State<PostSportsAddScreen> {
  List<String> _addedSportsList = [];

  @override
  void initState() {
    // TODO: implement initState
    _addedSportsList.addAll(widget.addedSportsList);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          roundedColorButton(
            textContent: 'Confirm',
            onPressed: () {
              Navigator.pop(context, _addedSportsList);
            },
          ),
          FutureBuilder<List>(
              future: Future.wait([
                TagAPI().getAllSports(),
              ]),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List sportsList = snapshot.data[0];
                  List<Widget> sportsButtonList = [];
                  for (Map map in sportsList) {
                    bool _isActivated = false;
                    if (_addedSportsList.contains(map['name'])) {
                      _isActivated = true;
                    }
                    sportsButtonList.add(
                      SportsButton(
                        sportsName: map['name'],
                        isActivated: _isActivated,
                        enabledCallback: () {
                          // Todo 여기에서 어떤 함수를 집어넣는지에 따라 다른 행동을 할 수 있도록 하고싶음
                          setState(() {
                            _addedSportsList.add(map['name']);
                          });
                        },
                        disabledCallback: () {
                          setState(() {
                            _addedSportsList.remove(map['name']);
                          });
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
              }),
        ]),
      ),
    );
  }
}
