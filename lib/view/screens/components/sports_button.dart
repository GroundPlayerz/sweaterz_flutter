import 'package:flutter/material.dart';
import 'package:sweaterz_flutter/networking_api/tag_api.dart';

import '../../constants/constants.dart';

class SportsButton extends StatefulWidget {
  final String sportsName;
  final bool isActivated;
  final Function enabledCallback;
  final Function disabledCallback;

  SportsButton(
      {this.sportsName,
      this.isActivated,
      this.enabledCallback,
      this.disabledCallback});
  @override
  _SportsButtonState createState() => _SportsButtonState();
}

class _SportsButtonState extends State<SportsButton> {
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
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setState(() {
          toggleButton();
        });
        if (_isActivated) {
          widget.enabledCallback();
        } else {
          widget.disabledCallback();
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
