import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sweaterz_flutter/networking_service/feed_service.dart';
import 'package:sweaterz_flutter/networking_service/post_detail_service.dart';
import 'package:sweaterz_flutter/view/constants/text_styles.dart';
import 'package:sweaterz_flutter/view/model/post.dart';
import 'package:sweaterz_flutter/view/screens/video_player.dart';
import 'package:sweaterz_flutter/view/screens/widget/post_profile_list_tile.dart';

class PostDetailScreen extends StatefulWidget {
  final Map postData;

  PostDetailScreen({this.postData});

  @override
  _PostDetailScreenState createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  Map _postData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _postData = widget.postData;
    PostDetailService().increaseViewCount(_postData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            postProfileListTile(
                email: _postData['creator_email'],
                profileName: _postData['creator_profile_name'],
                profilePhotoURL: _postData['creator_profile_photo_url'],
                createdTime: _postData['created_time'],
                viewCount: _postData['view_count']),
            SizedBox(
              height: 10,
            ),
            Text(
              _postData['content'],
              style: kPostBodyTextStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              width: double.infinity,
              child: Builder(builder: (context) {
                if (_postData['upload_type'] == 'video') {
                  return VideoPlayer(
                    videoDownloadURL: _postData['file_list'][0]['download_url'],
                  );
                } else if (_postData['upload_type'] == 'images') {
                  return Row(
                    children: [
                      for (Map image in _postData['file_list'])
                        CachedNetworkImage(
                          imageUrl: image['download_url'],
                          placeholder: (context, url) => Icon(Icons.photo),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          width: 50,
                          height: 30,
                        ),
                    ],
                  );
                } else {
                  return Container();
                }
              }),
            ),
            Container(
              height: 300,
            )
          ],
        ));
  }
}
