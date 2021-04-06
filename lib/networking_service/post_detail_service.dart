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
              return value.data()!['view_count'];
            });
            print('viewCount' + viewCount.toString());
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

  Future<void> pressPostLikeButton(Map postData) async {
    String currentUserEmail = _auth.currentUser!.email!;
    try {
      await _firestore.runTransaction((transaction) {
        DocumentReference postDocumentReference = _firestore
            .collection('sports_tag')
            .doc(postData['post_sports_tag'])
            .collection('post')
            .doc(postData['document_id']);
        return transaction.get(postDocumentReference).then((value) async {
          if (value.exists) {
            int likeCount = await postDocumentReference.get().then((value) {
              return value.data()!['like_count'];
            });
            print('likeCount' + likeCount.toString());
            transaction.update(postDocumentReference, {
              'like_count': likeCount + 1,
            });
            transaction.set(
                postDocumentReference
                    .collection('like_member')
                    .doc(currentUserEmail),
                {
                  'email': currentUserEmail,
                  'created_time': DateTime.now().toUtc(),
                },
                SetOptions(merge: true));
          }
        });
      });
      log('Increased like count!');
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> cancelPostLikeButton(Map postData) async {
    String currentUserEmail = _auth.currentUser!.email!;
    try {
      await _firestore.runTransaction((transaction) {
        DocumentReference postDocumentReference = _firestore
            .collection('sports_tag')
            .doc(postData['post_sports_tag'])
            .collection('post')
            .doc(postData['document_id']);
        return transaction.get(postDocumentReference).then((value) async {
          if (value.exists) {
            int likeCount = await postDocumentReference.get().then((value) {
              return value.data()!['like_count'];
            });
            print('likeCount' + likeCount.toString());
            transaction
                .update(postDocumentReference, {'like_count': likeCount - 1});
            transaction.delete(postDocumentReference
                .collection('like_member')
                .doc(currentUserEmail));
          }
        });
      });
      log('Decreased like count!');
    } catch (e) {
      log(e.toString());
    }
  }

  Future<bool> checkPostLikeButtonPressed(Map postData) {
    String currentUserEmail = _auth.currentUser!.email!;
    DocumentReference postDocumentLikeMemberRef = _firestore
        .collection('sports_tag')
        .doc(postData['post_sports_tag'])
        .collection('post')
        .doc(postData['document_id'])
        .collection('like_member')
        .doc(currentUserEmail);

    return postDocumentLikeMemberRef.get().then((value) {
      if (value.exists) {
        return true;
      } else {
        return false;
      }
    });
  }
}
