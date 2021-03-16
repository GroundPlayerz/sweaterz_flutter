import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sweaterz_flutter/networking_service/search_service.dart';

class SearchAPI {
  Future<QuerySnapshot> getRecentSearchHistory() async {
    return SearchService().getRecentSearchHistory();
  }

  Future<QuerySnapshot> searchByTag() async {
    return SearchService().searchByTag();
  }

  Future<QuerySnapshot> searchByMemberProfileName() async {
    return SearchService().searchByMemberProfileName();
  }

  Future<QuerySnapshot> searchByMemberEmail() async {
    return SearchService().searchByMemberEmail();
  }

  Future<QuerySnapshot> searchBySports() async {}
}
