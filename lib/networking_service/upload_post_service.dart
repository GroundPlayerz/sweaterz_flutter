import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'package:sweaterz_flutter/view/model/post.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

class UploadPostService {
  Future<String> uploadToStorageAndGetDownloadURL(
      Reference storageRef, File file) async {
    Reference fileRef = storageRef.child(DateTime.now().toIso8601String());

    UploadTask storageUploadTask = fileRef.putFile(file);
    String downloadURL;
    await storageUploadTask.whenComplete(() {});
    downloadURL = await fileRef.getDownloadURL();

    return downloadURL;
  }

  Future<void> uploadVideoTypePost(Post post) async {
    final DateTime now = DateTime.now().toUtc();
    final String formattedNow = DateFormat('yyyyMMdd').format(now);
    final String postDocumentId = post.profileName + now.toIso8601String();

    List<Map> downloadURLList = [];

    WriteBatch batch = _firestore.batch();
    DocumentReference _postRef = _firestore
        .collection('sports_tag')
        .doc(post.sports)
        .collection('post')
        .doc(postDocumentId); // post가 생기는 문서 레퍼런스
    Reference storageRef;

    //cloud storage
    storageRef = _firebaseStorage
        .ref()
        .child("$formattedNow/videos/${post.memberEmail}");
    //File upload to Cloud Storage
    try {
      for (int i = 0; i < post.videoFileList.length; i++) {
        String videoDownloadURL = await uploadToStorageAndGetDownloadURL(
            storageRef, post.videoFileList[i]['video_file']);
        String thumbnailDownloadURL = await uploadToStorageAndGetDownloadURL(
            storageRef, post.videoFileList[i]['thumbnail_file']);

        downloadURLList.add({
          'video_download_url': videoDownloadURL,
          'thumbnail_download_url': thumbnailDownloadURL
        });
      }
    } catch (e) {
      print(e);
    }

    //Post Metadata upload to firestore
    try {
      batch.set(_postRef, {
        'document_id': postDocumentId,
        'upload_type': post.uploadType,
        'content': post.content,
        'created_time': now,
        'creator_email': post.memberEmail,
        'creator_profile_name': post.profileName,
        'creator_profile_photo_url': post.profilePhotoUrl,
        'thumbnail_download_url': downloadURLList[0]['thumbnail_download_url'],
        'view_count': post.viewCount,
        'like_count': post.likeCount,
        'post_sports_tag': post.sports,
        'is_question': post.isQuestion,
      });

      List<Map> videoFileListToUpload = [];
      for (int i = 0; i < post.videoFileList.length; i++) {
        videoFileListToUpload.add({
          'original_file_name': post.videoFileList[i]['video_file'].path,
          'order': i,
          'download_url': downloadURLList[i]['video_download_url'],
          'size': post.videoFileList[i]['video_file'].lengthSync(),
          'media_length': post.videoFileList[i]['media_length'],
        });
      }
      batch.set(_postRef, {'file_list': videoFileListToUpload},
          SetOptions(merge: true));

      List<Map> tagListToUpload = [];
      for (int i = 0; i < post.tagsList.length; i++) {
        tagListToUpload.add({
          'name': post.tagsList[i],
          'order': i,
          'name_lower': post.tagsList[i].toLowerCase(),
          'created_time': now,
        });
      }
      batch.set(_postRef, {'post_tag_list': tagListToUpload},
          SetOptions(merge: true));

      log('Uploaded post successfully');
      batch.commit();
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> uploadImagesTypePost(Post post) async {
    final DateTime now = DateTime.now().toUtc();
    final String formattedNow = DateFormat('yyyyMMdd').format(now);
    final postDocumentId = post.profileName + now.toIso8601String();
    List<String> downloadURLList = [];

    WriteBatch batch = _firestore.batch();
    DocumentReference _postRef = _firestore
        .collection('sports_tag')
        .doc(post.sports)
        .collection('post')
        .doc(postDocumentId); // post가 생기는 문서 레퍼런스
    Reference storageRef;

    //cloud storage
    storageRef = _firebaseStorage
        .ref()
        .child("$formattedNow/images/${post.memberEmail}");

    //File upload to Cloud Storage
    try {
      for (int i = 0; i < post.imageFileList.length; i++) {
        Reference fileRef = storageRef.child(DateTime.now().toIso8601String());

        UploadTask storageUploadTask = fileRef.putFile(post.imageFileList[i]);
        String downloadURL;
        await storageUploadTask.whenComplete(() {});
        downloadURL = await fileRef.getDownloadURL();
        downloadURLList.add(downloadURL);
      }
    } catch (e) {
      print(e);
    }

    //Post Metadata upload to firestore
    try {
      batch.set(_postRef, {
        'document_id': postDocumentId,
        'upload_type': post.uploadType,
        'content': post.content,
        'created_time': now,
        'creator_email': post.memberEmail,
        'creator_profile_name': post.profileName,
        'creator_profile_photo_url': post.profilePhotoUrl,
        'view_count': post.viewCount,
        'like_count': post.likeCount,
        'post_sports_tag': post.sports,
        'is_question': post.isQuestion,
      });

      List<Map> imageFileListToUpload = [];
      for (int i = 0; i < post.imageFileList.length; i++) {
        imageFileListToUpload.add({
          'original_file_name': post.imageFileList[i].path,
          'order': i,
          'download_url': downloadURLList[i],
          'size': post.imageFileList[i].lengthSync(),
        });
      }
      batch.set(_postRef, {'file_list': imageFileListToUpload},
          SetOptions(merge: true));

      List<Map> tagListToUpload = [];
      for (int i = 0; i < post.tagsList.length; i++) {
        tagListToUpload.add({
          'name': post.tagsList[i],
          'order': i,
          'name_lower': post.tagsList[i].toLowerCase(),
          'created_time': now,
        });
      }
      batch.set(_postRef, {'post_tag_list': tagListToUpload},
          SetOptions(merge: true));

      log('Uploaded post successfully');
      batch.commit();
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> uploadTextTypePost(Post post) async {
    final DateTime now = DateTime.now().toUtc();
    final postDocumentId = post.profileName + now.toIso8601String();

    WriteBatch batch = _firestore.batch();
    DocumentReference _postRef = _firestore
        .collection('sports_tag')
        .doc(post.sports)
        .collection('post')
        .doc(postDocumentId); // post가 생기는 문서 레퍼런스

    //Post Metadata upload to firestore
    try {
      batch.set(_postRef, {
        'document_id': postDocumentId,
        'upload_type': post.uploadType,
        'content': post.content,
        'created_time': now,
        'creator_email': post.memberEmail,
        'creator_profile_name': post.profileName,
        'creator_profile_photo_url': post.profilePhotoUrl,
        'view_count': post.viewCount,
        'like_count': post.likeCount,
        'post_sports_tag': post.sports,
        'is_question': post.isQuestion,
      });

      List<Map> tagListToUpload = [];
      for (int i = 0; i < post.tagsList.length; i++) {
        tagListToUpload.add({
          'name': post.tagsList[i],
          'order': i,
          'name_lower': post.tagsList[i].toLowerCase(),
          'created_time': now,
        });
      }
      batch.set(_postRef, {'post_tag_list': tagListToUpload},
          SetOptions(merge: true));

      log('Uploaded post successfully');
      batch.commit();
    } catch (e) {
      log(e.toString());
    }
  }
}
