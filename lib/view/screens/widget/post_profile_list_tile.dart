import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sweaterz_flutter/networking_service/login_service.dart';

Widget postProfileListTile({
  String email,
  String profilePhotoURL,
  String profileName,
  Timestamp createdTime,
}) {
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
    leading: CachedNetworkImage(
      imageUrl: profilePhotoURL,
      placeholder: (context, url) => Icon(Icons.photo),
      errorWidget: (context, url, error) => Icon(Icons.error),
    ),
    title: Text(profileName),
    subtitle: Text(createdTime.toDate().toString()),
  );
}
