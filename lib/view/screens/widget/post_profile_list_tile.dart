import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sweaterz_flutter/view/constants/constants.dart';
import 'package:sweaterz_flutter/view/constants/text_styles.dart';

Widget postProfileListTile(
    {required String email,
    required String profilePhotoURL,
    required String profileName,
    required Timestamp createdTime,
    required int viewCount}) {
  List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  final DateTime createdDateTime = createdTime.toDate();
  final String stringMonth = months[createdDateTime.month - 1];
  final String stringDay = createdDateTime.day.toString();
  final String stringYear = createdDateTime.year.toString();

  Widget _circleAvatar = Container(
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.0),
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          blurRadius: 6,
          color: Colors.black.withOpacity(0.08),
          offset: Offset(0, 3),
        )
      ],
    ),
    child: CircleAvatar(
      radius: 25,
      backgroundImage: CachedNetworkImageProvider(
        profilePhotoURL,
      ),
    ),
  );

  return GestureDetector(
    onTap: () async {
      //  Todo 해당 멤버의 프로필로 이동
      User? currentUser = await FirebaseAuth.instance.currentUser;
      if (email == currentUser?.email) {
        // Todo 내 프로필로 이동
      } else {
        // Todo 다른사람 프로필로 이동
      }
    },
    child: Row(
      children: [
        _circleAvatar,
        SizedBox(width: 16.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              profileName,
              style: kPostProfileNameTextStyle.copyWith(color: Colors.black),
            ),
            SizedBox(height: 3.0),
            Row(children: [
              Text(
                stringMonth + ' ' + stringDay + ', ' + stringYear + '    ',
                style: kPostViewAndDateTextStyle.copyWith(
                    color: kGreyColor2_999999),
              ),
              Icon(
                Icons.remove_red_eye_outlined,
                size: 14.0,
                color: kGreyColor2_999999,
              ),
              SizedBox(width: 3.0),
              Text(
                ' $viewCount',
                style: kPostViewAndDateTextStyle.copyWith(
                    color: kGreyColor2_999999),
              ),
            ]),
          ],
        ),
      ],
    ),
  );
}
