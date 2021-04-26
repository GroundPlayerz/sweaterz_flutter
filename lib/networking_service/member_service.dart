import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sweaterz_flutter/networking_service/login_service.dart';

import '../config.dart';
import 'package:http/http.dart' as http;

final _firestore = FirebaseFirestore.instance;

class MemberService {
  Future<Map?> getMemberInfo() async {
    User? _currentUser = await LoginService().getCurrentUser();
    if (_currentUser != null) {
      final response = await http.get(Uri.parse(baseUrl + '/api/user'));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
      //return await http.get(Uri.parse(kIpConfig + '/api/user')).then((value) => value.data(););

      // return _firestore
      //     .collection('member')
      //     .doc(_currentUser.email)
      //     .get()
      //     .then((value) {
      //   return value.data();
    }
  }

  // Future<QuerySnapshot> getMemberProfile(String email) async {}
  //
  // Future<void> followMember(String email) async {
  //   //쿼리문 작
  // }
  //
  // Future<void> unfollowMember(String email) async {
  //   //쿼리문 작
  // }
  //
  // Future<QuerySnapshot> getFollowingMembers(String email) async {}
  //
  // Future<QuerySnapshot> getFollowerMembers(String email) async {}
  //
  // Future<void> updateEditedProfile(MemberProfile memberProfile) {}
}
