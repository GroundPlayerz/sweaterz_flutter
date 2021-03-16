import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sweaterz_flutter/networking_service/tag_service.dart';

class TagAPI {
  Future<List> getAllSports() async {
    return TagService().getAllSports();
  }

  Future<List> getFollowingSports() async {
    return TagService().getFollowingSports();
  }

  Future<void> followsSport(Map followSport) async {
    TagService().followsSport(followSport);
  }

  Future<void> unfollowsSport(Map unfollowSport) async {
    TagService().unfollowsSport(unfollowSport);
  }
}
