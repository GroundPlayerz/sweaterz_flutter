class MemberProfile {
  List<String>? _profileSports;
  String? _introduction;
  List<String>? _postIdList;

  void setProfileSports({required List<String> profileSports}) {
    this._profileSports = profileSports;
  }

  void setIntroduction({required String introduction}) {
    this._introduction = introduction;
  }

  void setPostIdList({required List<String> postIdList}) {
    this._postIdList = postIdList;
  }
}
