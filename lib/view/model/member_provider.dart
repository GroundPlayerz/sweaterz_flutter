import 'package:flutter/material.dart';
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
