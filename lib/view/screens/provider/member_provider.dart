import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sweaterz_flutter/networking_service/member_service.dart';
import 'package:sweaterz_flutter/networking_service/tag_service.dart';
import 'package:sweaterz_flutter/view/model/enums.dart';

class MemberProvider with ChangeNotifier {
  String? email;
  String? profileName;
  MemberRole? memberRole;
  String? profilePhotoURL;
  List<String>? followingSports;
  List<String>? followingMembers;
  List<String>? followerMembers;
  String? profileIntroduction;

  void logoutInitialize() {
    this.email = null;
    this.profileName = null;
    this.memberRole = null;
    this.profilePhotoURL = null;
    this.followingSports = null;
    this.followingMembers = null;
    this.followerMembers = null;
    this.profileIntroduction = null;
    notifyListeners();
  }

  Future<void> setLoggedInMemberProvider() async {
    Map? memberInfo = await MemberService().getMemberInfo();
    List<String> followingSports = await TagService().getFollowingSports();

    setEmail(email: memberInfo?['email']);
    setProfileName(profileName: memberInfo?['profile_name']);
    setMemberRole(memberRole: memberInfo?['member_role']);
    setProfilePhotoUrl(profilePhotoURL: memberInfo?['profile_photo_url']);
    setFollowingSports(followingSports: followingSports);
    setProfileIntroduction(
        profileIntroduction: memberInfo?['profile_introduction']);

    log('Set $email information complete!');
    notifyListeners();
  }

  void setEmail({required String email}) {
    this.email = email;
    notifyListeners();
  }

  void setProfileName({required String profileName}) {
    this.profileName = profileName;
    notifyListeners();
  }

  void setMemberRole({required String memberRole}) {
    MemberRole _memberRole;
    if (memberRole == "ADMIN") {
      _memberRole = MemberRole.ADMIN;
    } else if (memberRole == "GENERAL") {
      _memberRole = MemberRole.GENERAL;
    } else {
      _memberRole = MemberRole.COACH;
    }
    this.memberRole = _memberRole;
    notifyListeners();
  }

  void setProfilePhotoUrl({required String profilePhotoURL}) {
    this.profilePhotoURL = profilePhotoURL;
    notifyListeners();
  }

  void setFollowingSports({required List<String> followingSports}) {
    this.followingSports = followingSports;
    notifyListeners();
  }

  void setFollowingMembers({required List<String> followingMembers}) {
    this.followingMembers = followingMembers;
    notifyListeners();
  }

  void setFollowerMembers({required List<String> followerMembers}) {
    this.followerMembers = followerMembers;
    notifyListeners();
  }

  void setProfileIntroduction({required String profileIntroduction}) {
    this.profileIntroduction = profileIntroduction;
    notifyListeners();
  }
}
