import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sweaterz_flutter/bloc/cubit/sports_following_cubit.dart';
import 'package:sweaterz_flutter/bloc/state/sports_following_state.dart';

import 'package:sweaterz_flutter/model/sports/sports.dart';
import 'package:sweaterz_flutter/view/constants/constants.dart';

class SportsFollowingListWidget extends StatefulWidget {
  @override
  _SportsFollowingListWidgetState createState() =>
      _SportsFollowingListWidgetState();
}

class _SportsFollowingListWidgetState extends State<SportsFollowingListWidget> {
  Widget sportsButton(BuildContext context,
      {required bool isActivated, required Sports sport}) {
    Color defaultColor = Color(0xffE4E4E4);
    Color activatedColor = Colors.grey;
    return TextButton(
      onPressed: () {
        print('text button pressed ');
        if (isActivated) {
          BlocProvider.of<SportsFollowingCubit>(context)
              .unfollowSport(sport: sport);
        } else {
          BlocProvider.of<SportsFollowingCubit>(context)
              .followSport(sport: sport);
        }
      },
      style: TextButton.styleFrom(
        textStyle: kBodyTextStyle1M.copyWith(),
        primary: Colors.black,
        backgroundColor: isActivated ? activatedColor : defaultColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(kIphoneXHeight)),
        ),
      ),
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
          child: Text(sport.name)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SportsFollowingCubit, SportsFollowingState>(
        builder: (context, state) {
      print('is it rebuilding?');
      if (state is Empty) {
        return Container();
      } else if (state is Loading) {
        return Text('loading');
      } else if (state is Error) {
        return Text(state.message);
      } else if (state is Loaded) {
        final List<Sports> sportsList = state.sportsList;
        final List<Sports> userFollowingSportsList =
            state.userFollowingSportsList;
        List<Widget> sportsButtonList = [];
        for (Sports sport in sportsList) {
          bool _isActivated = false;
          if (userFollowingSportsList.length != 0) {
            for (Sports followingSport in userFollowingSportsList) {
              if (sport == followingSport) {
                _isActivated = true;
              }
            }
          }
          sportsButtonList.add(
              sportsButton(context, isActivated: _isActivated, sport: sport));
        }
        return Wrap(
          spacing: 5.0,
          runSpacing: 1.0,
          children: sportsButtonList,
        );
      }
      return Container();
    });
  }
}
