import 'package:flutter/material.dart';
import 'package:sweaterz_flutter/networking_api/tag_api.dart';

import '../../constants.dart';

class StatefulSportsButton extends StatefulWidget {
  final String sportsName;
  final bool isActivated;
  StatefulSportsButton({this.sportsName, this.isActivated});
  @override
  _StatefulSportsButtonState createState() => _StatefulSportsButtonState();
}

class _StatefulSportsButtonState extends State<StatefulSportsButton> {
  Color defaultColor = Color(0xffE4E4E4);
  Color activatedColor = Colors.grey;
  bool _isActivated = false;

  void toggleButton() {
    _isActivated = !_isActivated;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _isActivated = widget.isActivated;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setState(() {
          toggleButton();
        });
        if (_isActivated) {
          TagAPI().followsSport({'name': widget.sportsName});
        } else {
          TagAPI().unfollowsSport({'name': widget.sportsName});
        }
      },
      style: TextButton.styleFrom(
        textStyle: kBodyTextStyle1M.copyWith(),
        primary: Colors.black,
        backgroundColor: _isActivated ? activatedColor : defaultColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(kIphoneXHeight)),
        ),
      ),
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
          child: Text(widget.sportsName)),
    );
  }
}
