import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sweaterz_flutter/networking_service/post_service.dart';
import 'package:sweaterz_flutter/view/model/post.dart';

class PostAPI {
  void uploadPost(Post post) async {
    await PostService().uploadPost(post);
  }

  Future<QuerySnapshot> getPostByPostId(String postId) async {
    return PostService().getPostByPostId(postId);
  }
}
