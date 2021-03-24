import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sweaterz_flutter/networking_api/login_api.dart';
import 'package:sweaterz_flutter/view/model/member_provider.dart';
import 'package:sweaterz_flutter/view/model/post.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

class UploadPostService {
  double _progress = 0;

  double get progress => _progress;

  Future<bool> uploadPost(Post post) async {
    DateTime now = DateTime.now().toUtc();
    String formattedNow = DateFormat('yyyyMMdd').format(now);
    List<String> downloadURLList = [];

    WriteBatch batch = _firestore.batch();
    DocumentReference _postRef =
        _firestore.collection('post').doc(); // post가 생기는 문서 레퍼런스
    CollectionReference _postFilesRef =
        _postRef.collection('files'); // post 문서의 subcollection 'files'의 레퍼런스
    CollectionReference _postTagsRef =
        _postRef.collection('post_tag'); // post 문서의 subcollection 'tags'의 레퍼런스
    CollectionReference _postSportsTagsRef = _postRef.collection(
        'post_sports_tag'); //post 문서의 subcollection 'sports_tags'의 레퍼런스
    Reference storageRef;

    //cloud storage
    if (post.uploadType == 'images') {
      storageRef = _firebaseStorage
          .ref()
          .child("$formattedNow/images/${post.memberEmail}");
    } else if (post.uploadType == 'video') {
      storageRef = _firebaseStorage
          .ref()
          .child("$formattedNow/videos/${post.memberEmail}");
    } else {
      storageRef = null;
    }
    //File upload to Cloud Storage
    if (storageRef != null) {
      try {
        for (int i = 0; i < post.files.length; i++) {
          Reference fileRef =
              storageRef.child(DateTime.now().toIso8601String());

          UploadTask storageUploadTask = fileRef.putFile(post.files[i]);
          String downloadURL;

          storageUploadTask.snapshotEvents.listen((event) {
            _progress =
                event.bytesTransferred.toDouble() / event.totalBytes.toDouble();
          }).onError((error) {
            // do something to handle error
            print("Error while uploading file");
          });
          await storageUploadTask.whenComplete(() {});
          downloadURL = await fileRef.getDownloadURL();
          downloadURLList.add(downloadURL);
        }
      } catch (e) {
        print(e);
      }
    }

    //Post Metadata upload to firestore
    try {
      batch.set(_postRef, {
        'upload_type': post.uploadType,
        'content': post.content,
        'created_time': now,
        'creator_email': post.memberEmail,
        'creator_profile_name': post.profileName,
        'creator_profile_photo_url': post.profilePhotoUrl,
      });

      for (int i = 0; i < post.sportsList.length; i++) {
        batch.set(_postSportsTagsRef.doc(post.sportsList[i]), {
          'name': post.sportsList[i],
          'order': i,
          'created_time': now,
        });
        DocumentReference _sportRef =
            _firestore.collection('sports_tag').doc(post.sportsList[i]);
        int _taggedPostCount = await _sportRef.get().then((value) {
          return value.data()['tagged_post_count'];
        });
        if (_taggedPostCount != null) {
          batch.update(_sportRef, {'tagged_post_count': _taggedPostCount + 1});
        } else {
          batch.set(
              _sportRef, {'tagged_post_count': 1}, SetOptions(merge: true));
        }
      }

      for (int i = 0; i < post.tagsList.length; i++) {
        batch.set(_postTagsRef.doc(post.tagsList[i].toLowerCase()), {
          'name': post.tagsList[i],
          'order': i,
          'name_lower': post.tagsList[i].toLowerCase(),
          'created_time': now,
        });

        DocumentReference _tagRef =
            _firestore.collection('tag').doc(post.tagsList[i]);
        int _taggedPostCount = await _tagRef.get().then((value) {
          if (value.exists) {
            return value.data()['tagged_post_count'];
          } else {
            return null;
          }
        });
        if (_taggedPostCount != null) {
          batch.update(_tagRef, {'tagged_post_count': _taggedPostCount + 1});
        } else {
          batch.set(
              _tagRef,
              {
                'tagged_post_count': 1,
                'name_lower': post.tagsList[i].toLowerCase(),
              },
              SetOptions(merge: true));
        }
      }

      if (storageRef != null) {
        for (int i = 0; i < post.files.length; i++) {
          batch.set(_postFilesRef.doc(), {
            'original_file_name': post.files[i].path,
            'order': i,
            'stored_path_url': downloadURLList[i],
            'size': post.files[i].lengthSync(),
          });
        }
      }
      log('Uploaded post successfully');
      batch.commit();
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<QuerySnapshot> getPostByPostId(String postId) async {}
}
