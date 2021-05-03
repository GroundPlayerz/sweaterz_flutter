import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sweaterz_flutter/view/constants/constants.dart';
import 'package:sweaterz_flutter/view/constants/text_styles.dart';

Widget sportTagAndTagScrollView(Map postData) => Row(
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            dragStartBehavior: DragStartBehavior.start,
            child: Row(
              children: [
                sportsTagWidget(postData),
                for (Map tag in postData['post_tag_list'])
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 4,
                      left: 4,
                    ),
                    child: tagWidget(tag),
                  ),
              ],
            ),
          ),
        ),
      ],
    );

Widget sportsTagWidget(Map postData) => GestureDetector(
      onTap: () {
        //Todo 해당 스포츠 게시물을 모아놓은 피드로 이동
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 4.0),
        child: Container(
          decoration: BoxDecoration(
            color: kGreenColorfromRGBO,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6.0),
            child: Text(
              postData['post_sports_tag'],
              style: kSportsTagTextStyle.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );

Widget tagWidget(Map tag) => GestureDetector(
      onTap: () {
        //Todo 해당 스포츠 게시물을 모아놓은 피드로 이동
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffD6D6D6)),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6.0),
          child: Text(
            '#${tag['name']}',
            style: kTagTextStyle.copyWith(color: Colors.black),
          ),
        ),
      ),
    );
