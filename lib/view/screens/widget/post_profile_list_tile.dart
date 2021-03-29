import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sweaterz_flutter/networking_service/login_service.dart';
import 'package:sweaterz_flutter/view/constants/constants.dart';

Widget postProfileListTile(
    {String email,
    String profilePhotoURL,
    String profileName,
    Timestamp createdTime,
    int viewCount}) {
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

  return ListTile(
    onTap: () async {
      //  Todo 해당 멤버의 프로필로 이동
      User currentUser = await LoginService().getCurrentUser();
      if (email == currentUser.email) {
        // Todo 내 프로필로 이동
      } else {
        // Todo 다른사람 프로필로 이동
      }
    },
    leading: CircleAvatar(
      radius: 30,
      backgroundImage: CachedNetworkImageProvider(
        profilePhotoURL,
      ),
    ),
    title: Text(
      profileName,
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    subtitle: Row(children: [
      Icon(
        Icons.remove_red_eye_outlined,
        size: 14.0,
        color: kGreyColor2_767676,
      ),
      Text(' $viewCount / '),
      Text(stringMonth + ' ' + stringDay + ', ' + stringYear),
    ]),
  );
}
