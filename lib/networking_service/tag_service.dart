import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;

class TagService {
  Future<List> getAllSports() async {
    List<Map> sportsList = [];
    await _firestore.collection('sports_tag').get().then((value) {
      value.docs.forEach((doc) {
        sportsList.add({'name': doc['name']});
      });
    });
    return sportsList;
  }

  Future<List> getFollowingSports() async {
    List followingSportsList = [];
    await _firestore
        .collection('member')
        .doc(_auth.currentUser.email)
        .collection('following_sports')
        .get()
        .then((value) {
      value.docs.forEach((doc) {
        followingSportsList.add(doc['name']);
      });
    });
    return followingSportsList;
  }

  Future<void> followsSport(Map followSport) async {
    String _currentUserEmail = _auth.currentUser.email.toString();
    DocumentReference _sportRef =
        _firestore.collection('sports_tag').doc(followSport['name']);
    DocumentReference _followerRef =
        _sportRef.collection('follower').doc(_currentUserEmail);
    DocumentReference _memberRef = _firestore
        .collection('member')
        .doc(_currentUserEmail)
        .collection('following_sports')
        .doc(followSport['name']);
    try {
      await _firestore.runTransaction((transaction) {
        return transaction.get(_followerRef).then((value) async {
          if (!value.exists) {
            int _followingMemberCount = await _sportRef.get().then((value) {
              return value.data()['following_member_count'];
            });
            transaction.update(_sportRef,
                {'following_member_count': _followingMemberCount + 1});
            transaction.set(_followerRef, {
              'email': _currentUserEmail,
              'created_time': DateTime.now().toUtc()
            });
            transaction.set(_memberRef, {
              'name': followSport['name'],
              'created_time': DateTime.now().toUtc()
            });
          }
        });
      });
      log('Follows ${followSport['name']} successfully');
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> unfollowsSport(Map unfollowSport) async {
    String _currentUserEmail = _auth.currentUser.email.toString();
    DocumentReference _sportRef =
        _firestore.collection('sports_tag').doc(unfollowSport['name']);
    DocumentReference _followerRef =
        _sportRef.collection('follower').doc(_currentUserEmail);
    DocumentReference _memberRef = _firestore
        .collection('member')
        .doc(_currentUserEmail)
        .collection('following_sports')
        .doc(unfollowSport['name']);

    try {
      _firestore.runTransaction((transaction) {
        return transaction.get(_followerRef).then((value) async {
          if (value.exists) {
            int _followingMemberCount = await _sportRef.get().then((value) {
              return value.data()['following_member_count'];
            });
            transaction.update(_sportRef,
                {'following_member_count': _followingMemberCount - 1});
            transaction.delete(_followerRef);
            transaction.delete(_memberRef);
          }
        });
      });
      log('unfollows ${unfollowSport['name']} successfully');
    } catch (e) {
      log(e);
    }
  }
}
