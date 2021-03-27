import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PostDetailService {
  final _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<DocumentSnapshot> getPostByDocumentId({String postDocumentId}) {
    return _firestore.collection('post').doc(postDocumentId).snapshots();
  }
}
