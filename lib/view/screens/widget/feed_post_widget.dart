import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sweaterz_flutter/view/constants/constants.dart';
import 'package:sweaterz_flutter/view/constants/text_styles.dart';
import 'package:sweaterz_flutter/view/screens/image_text_post_detail_screen.dart';
import 'package:sweaterz_flutter/view/screens/video_post_detail_screen.dart';
import 'package:sweaterz_flutter/view/screens/widget/post_profile_list_tile.dart';
import 'package:sweaterz_flutter/view/screens/widget/sports_tag_and_tag_scroll_view.dart';

Widget feedPostWidget({
  required BuildContext context,
  required Map postData,
  required int postDataIndex,
  required String feedType,
}) {
  Widget _isQuestionWidget() =>
      postData['is_question'] != null && postData['is_question'] == true
          ? Padding(
              padding: EdgeInsets.only(left: 3, right: 12.0),
              child: SizedBox(
                width: 16,
                child: Image(
                  image: AssetImage('images/question_mark_big@3x.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            )
          : Container();

  Widget _contentWidget = Expanded(
    child: Text(
      postData['content'],
      style: kPostBodyTextStyle,
      maxLines: 5,
      softWrap: false,
      overflow: TextOverflow.ellipsis,
    ),
  );

  Widget _videoTypeWidget() => Column(
        children: [
          SizedBox(height: 20.0),
          Stack(alignment: Alignment.center, children: [
            Container(
              height: 90.0,
              width: 160.0,
              child: CachedNetworkImage(
                imageUrl: postData['thumbnail_download_url'],
                errorWidget: (context, url, error) => Icon(Icons.error),
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
          ]),
        ],
      );

  Widget _imageTypeWidget = Builder(builder: (context) {
    int fileLength = postData['file_list'].length;
    return Column(
      children: [
        SizedBox(height: 20.0),
        Container(
          height: 150,
          width: double.infinity,
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: fileLength > 3 ? 3 : fileLength,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 90.0,
                    height: 67.5,
                    child: CachedNetworkImage(
                      imageUrl: postData['file_list'][index]['download_url'],
                      errorWidget: (context, url, error) => Icon(Icons.error),
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
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  });

  return Padding(
    padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 19.0),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25.0),
              sportTagAndTagScrollView(postData),
              SizedBox(height: 21.0),
              postProfileListTile(
                  email: postData['creator_email'],
                  profileName: postData['creator_profile_name'],
                  profilePhotoURL: postData['creator_profile_photo_url'],
                  createdTime: postData['created_time'],
                  viewCount: postData['view_count']),
              SizedBox(
                height: 19.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _isQuestionWidget(),
                      _contentWidget,
                    ],
                  ),
                  Builder(
                    builder: (context) {
                      if (postData['upload_type'] == 'video') {
                        return _videoTypeWidget();
                      } else if (postData['upload_type'] == 'images') {
                        return _imageTypeWidget;
                      } else {
                        return Container();
                      }
                    },
                  ),
                  SizedBox(height: 22),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
