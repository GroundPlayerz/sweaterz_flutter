import 'package:flutter/material.dart';
import 'package:sweaterz_flutter/view/constants/constants.dart';

import 'components/sports_button.dart';

class PostSportsAddScreen extends StatefulWidget {
  final String? addedSports;

  PostSportsAddScreen({this.addedSports});

  @override
  _PostSportsAddScreenState createState() => _PostSportsAddScreenState();
}

class _PostSportsAddScreenState extends State<PostSportsAddScreen> {
  String? _addedSports;

  @override
  void initState() {
    // TODO: implement initState
    _addedSports = widget.addedSports;
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
      backgroundColor: kBackgroundWhiteColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: kBackgroundWhiteColor,
        iconTheme: IconThemeData(
          color: kIconGreyColor1_B2B2B2, //change your color here
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context, _addedSports);
              },
              child: Text('Done'))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(children: [
            Builder(
                // TagService().getAllSports()
                builder: (context) {
              final List snapshot = ['jiujitsu', 'swimming', 'choiuuiui'];
              if (snapshot.isNotEmpty) {
                List sportsList = snapshot;
                List<Widget> sportsButtonList = [];
                for (Map map in sportsList) {
                  bool _isActivated = false;
                  bool _isEnabled = _addedSports == null ? true : false;
                  if (_addedSports == map['name']) {
                    _isActivated = true;
                    _isEnabled = true;
                  }
                  sportsButtonList.add(
                    SportsButton(
                      sportsName: map['name'],
                      isActivated: _isActivated,
                      isEnabled: _isEnabled,
                      activatedCallback: () {
                        // Todo 여기에서 어떤 함수를 집어넣는지에 따라 다른 행동을 할 수 있도록 하고싶음
                        setState(() {
                          _addedSports = map['name'];
                        });
                      },
                      deactivatedCallback: () {
                        setState(() {
                          _addedSports = null;
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
              } else if (snapshot.isEmpty) {
                return Text('error');
              } else {
                return Text('loading');
              }
            }),
            TextButton(
                onPressed: () {},
                child: Text('Isn\'t there any sport you want?')),
          ]),
        ),
      ),
    );
  }
}
