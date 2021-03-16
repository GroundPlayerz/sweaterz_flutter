import 'package:flutter/material.dart';

enum TabItem { HOME, FOLLOWING, UPLOAD, LOCAL, PROFILE }

const Map<TabItem, String> tabName = {
  TabItem.HOME: 'Home',
  TabItem.FOLLOWING: 'Following',
  TabItem.UPLOAD: 'Upload',
  TabItem.LOCAL: 'Local',
  TabItem.PROFILE: 'Profile',
};
