import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sweaterz_flutter/networking_service/member_service.dart';
import 'package:sweaterz_flutter/view/model/member_profile.dart';

class MemberAPI {
  Future<Map> getMemberInfo() async {
    return MemberService().getMemberInfo();
  }

  Future<QuerySnapshot> getMemberProfile(String email) async {
    return MemberService().getMemberProfile(email);
  }

  Future<void> followMember(String othersEmail) async {
    MemberService().followMember(othersEmail);
  }

  Future<void> unfollowMember(String othersEmail) async {
    MemberService().unfollowMember(othersEmail);
  }

  Future<List<Map>> getFollowingMembers(String email) async {
    MemberService().getFollowingMembers(email);
  }

  Future<List<Map>> getFollowerMembers(String email) async {
    MemberService().getFollowerMembers(email);
  }

  Future<void> updateEditedProfile(MemberProfile memberProfile) {
    MemberService().updateEditedProfile(memberProfile);
  }
}
