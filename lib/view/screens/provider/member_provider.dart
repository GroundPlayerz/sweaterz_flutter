import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sweaterz_flutter/networking_service/login_service.dart';
import 'package:sweaterz_flutter/networking_service/member_service.dart';
import 'package:sweaterz_flutter/view/model/enums.dart';

class MemberProvider with ChangeNotifier {
  String email;
  String profileName;
  MemberRole memberRole;
  String profilePhotoURL;
  List followingSports;
  List<String> followingMembers;
  List<String> followerMembers;

  void initialize() {
    this.email = null;
    this.profileName = null;
    this.memberRole = null;
    this.profilePhotoURL = null;
    notifyListeners();
  }

  Future<void> setLoggedInMemberProvider() async {
    User _currentUser = await LoginService().getCurrentUser();
    assert(_currentUser != null);
    Map memberInfo = await MemberService().getMemberInfo();
    setEmail(email: memberInfo['email']);
    setProfileName(profileName: memberInfo['profile_name']);
    setMemberRole(memberRole: memberInfo['member_role']);
    setProfilePhotoUrl(profilePhotoURL: memberInfo['profile_photo_url']);
    log('Set $email information complete!');
    notifyListeners();
  }

  void setEmail({String email}) {
    this.email = email;
    notifyListeners();
  }

  void setProfileName({String profileName}) {
    this.profileName = profileName;
    notifyListeners();
  }

  void setMemberRole({String memberRole}) {
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

  void setProfilePhotoUrl({String profilePhotoURL}) {
    this.profilePhotoURL = profilePhotoURL;
    notifyListeners();
  }

  void setFollowingSports({List<String> followingSports}) {
    this.followingSports = followingSports;
    notifyListeners();
  }

  void setFollowingMembers({List<String> followingMembers}) {
    this.followingMembers = followingMembers;
    notifyListeners();
  }

  void setFollowerMembers({List<String> followerMembers}) {
    this.followerMembers = followerMembers;
    notifyListeners();
  }
}
