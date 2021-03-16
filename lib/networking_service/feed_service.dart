import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sweaterz_flutter/view/model/enums.dart';

final _firestore = FirebaseFirestore.instance;

class FeedService {
  Future<QuerySnapshot> loadHotFeed(
    List sportsList,
    PeriodType periodType,
    LocationType locationType,
  ) async {}

  Future<QuerySnapshot> loadNewFeed(
    List sportsList,
    PeriodType periodType,
    LocationType locationType,
  ) async {}

  Future<QuerySnapshot> loadFollowingFeed(
    List sportsList,
    PeriodType periodType,
    LocationType locationType,
  ) async {}
}
