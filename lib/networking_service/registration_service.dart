import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sweaterz_flutter/view/model/enums.dart';

final _firestore = FirebaseFirestore.instance;
final _auth = FirebaseAuth.instance;

class RegistrationService {
  User _currentUser = _auth.currentUser;

  Future<bool> isRegistered() async {
    String email = _currentUser.email;
    var query =
        _firestore.collection('member').where('email', isEqualTo: email);

    bool isRegistered = await query.get().then((result) {
      if (result.docs.isNotEmpty) {
        log('This member is registered');
        return true;
      } else {
        log('This member is not registered, go to register screens');
        return false;
      }
    });
    return isRegistered;
  }

  void setInitialProfileName(profileName) async {
    try {
      _firestore.collection('member').doc('${_currentUser.email}').set({
        'email': _currentUser.email,
        'profile_name': profileName,
      });
    } catch (e) {
      log(e);
    }
  }

  void setInitialMemberInfo() async {
    try {
      _firestore.collection('member').doc('${_currentUser.email}').set({
        'member_role': MemberRole.GENERAL.toString().split('.').last,
        'profile_photo_url': _currentUser.photoURL,
      }, SetOptions(merge: true));
    } catch (e) {
      log(e);
    }
  }
}
