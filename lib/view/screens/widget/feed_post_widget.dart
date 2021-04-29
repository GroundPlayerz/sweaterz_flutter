import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sweaterz_flutter/view/constants/constants.dart';
import 'package:sweaterz_flutter/view/constants/text_styles.dart';
import 'package:sweaterz_flutter/view/screens/image_text_post_detail_screen.dart';
import 'package:sweaterz_flutter/view/screens/video_post_detail_screen.dart';
import 'package:sweaterz_flutter/view/screens/widget/post_profile_list_tile.dart';

Widget feedPostWidget({
  required BuildContext context,
  required Map postData,
  required int postDataIndex,
  required String feedType,
}) {
  Widget _sportsTagWidget() => GestureDetector(
        onTap: () {
          //Todo 해당 스포츠 게시물을 모아놓은 피드로 이동
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Container(
            decoration: BoxDecoration(
              color: kGreenColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 6.0),
              child: Text(
                postData['post_sports_tag'],
                style: kSportsTagTextStyle.copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      );

  Widget _tagWidget(Map tag) => GestureDetector(
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
              style: kTagTextStyle,
            ),
          ),
        ),
      );

  return Padding(
    padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 27.0),
    child: GestureDetector(
      onTap: () async {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          if (postData['upload_type'] == "video") {
            return VideoPostDetailScreen(
              postDataIndex: postDataIndex,
              feedType: feedType,
            );
          } else {
            return ImageTextPostDetailScreen(
              postDataIndex: postDataIndex,
              feedType: feedType,
            );
          }
        }));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 27.0),
            Row(
              children: [
                SizedBox(width: 18.0),
                _sportsTagWidget(),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    dragStartBehavior: DragStartBehavior.start,
                    child: Row(
                      children: [
                        for (Map tag in postData['post_tag_list'])
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 4,
                              right: 4,
                            ),
                            child: _tagWidget(tag),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            postProfileListTile(
                email: postData['creator_email'],
                profileName: postData['creator_profile_name'],
                profilePhotoURL: postData['creator_profile_photo_url'],
                createdTime: postData['created_time'],
                viewCount: postData['view_count']),
            Padding(
              padding: EdgeInsets.fromLTRB(22, 5, 22, 21),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    postData['is_question'] != null &&
                            postData['is_question'] == true
                        ? Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: SizedBox(
                              width: 16,
                              child: Image(
                                image: AssetImage(
                                    'images/question_mark_big@3x.png'),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          )
                        : Container(),
                    Expanded(
                      child: Text(
                        postData['content'],
                        style: kPostBodyTextStyle,
                        maxLines: 5,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ]),
                  SizedBox(height: 10.0),
                  Builder(
                    builder: (context) {
                      if (postData['upload_type'] == 'video') {
                        return Stack(alignment: Alignment.center, children: [
                          Container(
                            height: 90.0,
                            width: 160.0,
                            child: CachedNetworkImage(
                              imageUrl: postData['thumbnail_download_url'],
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            height: 90.0,
                            width: 160.0,
                            color: Colors.black.withOpacity(0.4),
                          ),
                          Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        ]);
                      } else if (postData['upload_type'] == 'images') {
                        int fileLength = postData['file_list'].length;
                        return Container(
                          height: 150,
                          width: double.infinity,
                          child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: fileLength > 3 ? 3 : fileLength,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 4.0,
                                    mainAxisSpacing: 4.0),
                            itemBuilder: (BuildContext context, int index) {
                              return Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: 90.0,
                                    height: 67.5,
                                    child: CachedNetworkImage(
                                      imageUrl: postData['file_list'][index]
                                          ['download_url'],
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    height: 67.5,
                                    width: 90.0,
                                    color: Colors.black.withOpacity(0.4),
                                  ),
                                  if (index == 2 && fileLength > 3)
                                    Text(
                                      '+' + (fileLength - 3).toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20.0),
                                    ),
                                ],
                              );
                            },
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
