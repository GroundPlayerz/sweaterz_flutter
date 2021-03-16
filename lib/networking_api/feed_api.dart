import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sweaterz_flutter/networking_service/feed_service.dart';
import 'package:sweaterz_flutter/view/model/enums.dart';

class FeedAPI {
  Future<QuerySnapshot> loadHotFeed(
    List sportsList,
    PeriodType periodType,
    LocationType locationType,
  ) async {
    return FeedService().loadHotFeed(
      sportsList,
      periodType,
      locationType,
    );
  }

  Future<QuerySnapshot> loadNewFeed(
    List sportsList,
    PeriodType periodType,
    LocationType locationType,
  ) async {
    return FeedService().loadNewFeed(
      sportsList,
      periodType,
      locationType,
    );
  }

  Future<QuerySnapshot> loadFollowingFeed(
    List sportsList,
    PeriodType periodType,
    LocationType locationType,
  ) async {
    return FeedService().loadFollowingFeed(
      sportsList,
      periodType,
      locationType,
    );
  }
}
