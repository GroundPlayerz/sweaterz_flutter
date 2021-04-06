import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class SportsButton extends StatefulWidget {
  final String sportsName;
  final bool isActivated;
  final Function activatedCallback;
  final Function deactivatedCallback;
  final bool isEnabled;

  SportsButton(
      {required this.sportsName,
      required this.isActivated,
      required this.activatedCallback,
      required this.deactivatedCallback,
      this.isEnabled = true});
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
        if (widget.isEnabled) {
          setState(() {
            toggleButton();
          });
          if (_isActivated) {
            widget.activatedCallback();
          } else {
            widget.deactivatedCallback();
          }
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
