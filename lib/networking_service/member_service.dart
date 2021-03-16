import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sweaterz_flutter/networking_api/login_api.dart';
import 'package:sweaterz_flutter/view/model/member_profile.dart';

final _firestore = FirebaseFirestore.instance;

class MemberService {
  Future<Map> getMemberInfo() async {
    User _currentUser = await LoginAPI().getCurrentUser();
    return _firestore
        .collection('member')
        .doc(_currentUser.email)
        .get()
        .then((value) {
      return value.data();
    });
  }

  Future<QuerySnapshot> getMemberProfile(String email) async {}

  Future<void> followMember(String email) async {
    //쿼리문 작
  }

  Future<void> unfollowMember(String email) async {
    //쿼리문 작
  }

  Future<QuerySnapshot> getFollowingMembers(String email) async {}

  Future<QuerySnapshot> getFollowerMembers(String email) async {}

  Future<void> updateEditedProfile(MemberProfile memberProfile) {}
}
