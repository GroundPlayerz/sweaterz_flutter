import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;

class FeedService {
  DocumentSnapshot lastDocument;
  int documentLimit = 20;
  bool hasMore = true;
  bool isLoading = false;

  Future<List<DocumentSnapshot>> fetchHomeFeed(
      {List creatorEmailList, bool isOrderedBy = true}) async {
    DateTime threeDaysAgoDateTime =
        DateTime.now().subtract(Duration(days: 3)).toUtc();
    QuerySnapshot querySnapshot;

    if (lastDocument == null) {
      querySnapshot = await _firestore
          .collectionGroup("post")
          .where("created_time", isGreaterThanOrEqualTo: threeDaysAgoDateTime)
          .orderBy("created_time", descending: true)
          .limit(10)
          .get();
    } else {
      querySnapshot = await _firestore
          .collectionGroup("post")
          .where("created_time", isGreaterThanOrEqualTo: threeDaysAgoDateTime)
          .orderBy("created_time", descending: true)
          .startAfterDocument(lastDocument)
          .limit(20)
          .get();
    }

    if (querySnapshot.docs.length < documentLimit) {
      hasMore = false;
    }

    lastDocument = querySnapshot.docs[querySnapshot.docs.length - 1];
    return querySnapshot.docs;
  }

  Future<List<DocumentSnapshot>> fetchQuestionFeed(
      {List creatorEmailList, bool isOrderedBy = true}) async {
    DateTime threeDaysAgoDateTime =
        DateTime.now().subtract(Duration(days: 3)).toUtc();
    QuerySnapshot querySnapshot;

    if (lastDocument == null) {
      querySnapshot = await _firestore
          .collectionGroup("post")
          .where("is_question", isEqualTo: true)
          .where("created_time", isGreaterThanOrEqualTo: threeDaysAgoDateTime)
          .orderBy("created_time", descending: true)
          .limit(10)
          .get();
    } else {
      querySnapshot = await _firestore
          .collectionGroup("post")
          .where("is_question", isEqualTo: true)
          .where("created_time", isGreaterThanOrEqualTo: threeDaysAgoDateTime)
          .orderBy("created_time", descending: true)
          .startAfterDocument(lastDocument)
          .limit(20)
          .get();
    }

    if (querySnapshot.docs.length < documentLimit) {
      hasMore = false;
    }

    lastDocument = querySnapshot.docs[querySnapshot.docs.length - 1];
    return querySnapshot.docs;
  }
}
