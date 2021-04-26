enum PostPrivacy { ALL, ONLY_FOLLOWERS, ONLY_ME }

enum FeedbackPrivacy { ALL, ONLY_FOLLOWERS, ONLY_ME }

enum Role { ADMIN, GENERAL, COACH }

enum PeriodType {
  ANY_TIME,
  PAST_HOUR,
  PAST_24HOURS,
  PAST_WEEK,
  PAST_MONTH,
  PAST_YEAR
}

enum LocationType { ANYWHERE, THIS_COUNTRY, AROUND_ME }

enum FeedbackTimeType { RANGE, POINT }

enum FeedbackType { GENERAL, QUESTION }
