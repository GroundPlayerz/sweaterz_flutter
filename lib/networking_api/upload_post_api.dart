import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sweaterz_flutter/networking_service/upload_post_service.dart';
import 'package:sweaterz_flutter/view/model/post.dart';

class UploadPostAPI {
  UploadPostService uploadPostService = UploadPostService();

  Future<bool> uploadPost(Post post) async {
    return uploadPostService.uploadPost(post);
  }

  double getUploadProgress() {
    return uploadPostService.progress;
  }
}
