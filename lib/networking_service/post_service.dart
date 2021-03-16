import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sweaterz_flutter/view/model/post.dart';

class PostService {
  Future<void> uploadPost(Post post) async {
    //  Batch로 Write하기!! (트랜잭션 처리)
  }

  Future<QuerySnapshot> getPostByPostId(String postId) async {}
}
