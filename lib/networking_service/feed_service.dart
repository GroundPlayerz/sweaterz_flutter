import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sweaterz_flutter/view/model/enums.dart';
import 'package:sweaterz_flutter/view/model/post.dart';

final _firestore = FirebaseFirestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;

class FeedService {
  DocumentSnapshot lastDocument;
  int documentLimit = 20;
  bool hasMore = true;
  bool isLoading = false;

  Future<List<DocumentSnapshot>> fetchFollowingFeed(
      {List creatorEmailList, bool isOrderedBy = true}) async {
    DateTime threeDaysAgoDateTime =
        DateTime.now().subtract(Duration(days: 3)).toUtc();
    QuerySnapshot querySnapshot;

    if (lastDocument == null) {
      querySnapshot = await _firestore
          .collectionGroup("post")
          .where("created_time", isGreaterThanOrEqualTo: threeDaysAgoDateTime)
          .orderBy("created_time", descending: true)
          .limit(20)
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
}
