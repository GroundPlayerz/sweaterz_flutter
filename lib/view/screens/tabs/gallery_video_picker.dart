import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:sweaterz_flutter/view/screens/tabs/image_upload_screen.dart';
import 'package:sweaterz_flutter/view/screens/tabs/video_upload_screen.dart';

class GalleryVideoPicker extends StatefulWidget {
  final String title = 'Photo manager test';

  @override
  _GalleryVideoPickerState createState() => _GalleryVideoPickerState();
}

class _GalleryVideoPickerState extends State<GalleryVideoPicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.home),
        //     onPressed: () {
        //       Get.to(ImageUploadScreen());
        //     },
        //   )
        // ],
      ),
      body: MediaGrid(),
    );
  }
}

class MediaGrid extends StatefulWidget {
  @override
  _MediaGridState createState() => _MediaGridState();
}

class _MediaGridState extends State<MediaGrid> {
  List<Widget> _mediaList = [];
  int currentPage = 0;
  int lastPage;
  List<File> imageFileList = [];

  @override
  void initState() {
    super.initState();
    _fetchNewVideos();
  }

  _handleScrollEvent(ScrollNotification scroll) {
    if (scroll.metrics.pixels / scroll.metrics.maxScrollExtent > 0.33) {
      if (currentPage != lastPage) {
        _fetchNewVideos();
      }
    }
  }

  _fetchNewVideos() async {
    lastPage = currentPage;
    var result = await PhotoManager.requestPermission();
    if (result) {
      List<AssetPathEntity> albums =
          await PhotoManager.getAssetPathList(onlyAll: true);
      print('albums: $albums');

      List<Widget> temp = [];
      while (temp.length <= 30) {
        lastPage = currentPage;
        List<AssetEntity> media = await albums[0].getAssetListPaged(
          currentPage,
          30,
        );
        print('media: $media');

        if (media.length == 0) break;

        for (var asset in media) {
          if (asset.type == AssetType.video) {
            temp.add(
              FutureBuilder(
                future: asset.thumbDataWithSize(200, 200),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return GestureDetector(
                      onTap: () async {
                        File file = await asset.file;
                        print('${file.toString()} is selected');
                        Get.to(() => VideoUploadScreen(
                              videoFile: file,
                            ));
                      },
                      child: Stack(
                        children: <Widget>[
                          Positioned.fill(
                            child: Image.memory(
                              snapshot.data,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 5, bottom: 5),
                              child: Icon(
                                Icons.videocam,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Text('Something Wrong');
                  }
                },
              ),
            );
          }
        }
        setState(() {
          currentPage++;
        });
      }
      setState(() {
        _mediaList.addAll(temp);
      });
    } else {
      // fail
      /// if result is fail, you can call `PhotoManager.openSetting();`  to open android/ios applicaton's setting to get permission
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scroll) {
        _handleScrollEvent(scroll);
        return;
      },
      child: GridView.builder(
          itemCount: _mediaList.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return _mediaList[index];
          }),
    );
  }
}
