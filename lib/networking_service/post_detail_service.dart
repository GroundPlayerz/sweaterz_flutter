import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PostDetailService {
  final _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> increaseViewCount(Map postData) async {
    try {
      await _firestore.runTransaction((transaction) {
        DocumentReference postDocumentReference = _firestore
            .collection('sports_tag')
            .doc(postData['post_sports_tag'])
            .collection('post')
            .doc(postData['document_id']);
        return transaction.get(postDocumentReference).then((value) async {
          if (value.exists) {
            int viewCount = await postDocumentReference.get().then((value) {
              return value.data()['view_count'];
            });
            transaction
                .update(postDocumentReference, {'view_count': viewCount + 1});
          }
        });
      });
      log('Increased view count!');
    } catch (e) {
      log(e.toString());
    }
  }
}
