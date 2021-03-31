class MemberProfile {
  List<String> _profileSports;
  String _introduction;
  List<String> _postIdList;

  void setProfileSports({List<String> profileSports}) {
    this._profileSports = profileSports;
  }

  void setIntroduction({String introduction}) {
    this._introduction = introduction;
  }

  void setPostIdList({List<String> postIdList}) {
    this._postIdList = postIdList;
  }
}
