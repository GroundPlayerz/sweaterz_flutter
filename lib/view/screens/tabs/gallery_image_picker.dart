import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:sweaterz_flutter/view/screens/tabs/image_upload_screen.dart';
import 'package:sweaterz_flutter/view/screens/tabs/video_upload_screen.dart';

class GalleryImagePicker extends StatefulWidget {
  final String title = 'Photo manager test';
  @override
  _GalleryImagePickerState createState() => _GalleryImagePickerState();
}

class _GalleryImagePickerState extends State<GalleryImagePicker> {
  List<Widget> _mediaList = [];
  int currentPage = 0;
  int lastPage;
  List<File> imageFileList = [];

  @override
  void initState() {
    super.initState();
    _fetchNewImages();
  }

  _handleScrollEvent(ScrollNotification scroll) {
    if (scroll.metrics.pixels / scroll.metrics.maxScrollExtent > 0.33) {
      if (currentPage != lastPage) {
        _fetchNewImages();
      }
    }
  }

  _fetchNewImages() async {
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
          if (asset.type == AssetType.image) {
            temp.add(
              FutureBuilder(
                future: asset.thumbDataWithSize(200, 200),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return GestureDetector(
                      onTap: () async {
                        File file = await asset.file;
                        setState(() {
                          imageFileList.add(file);
                        });
                        print('${file.toString()} is selected');
                      },
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image.memory(
                              snapshot.data,
                              fit: BoxFit.cover,
                            ),
                          ),
                          if (imageFileList.contains(asset.file))
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: 5, bottom: 5),
                                child: Icon(
                                  Icons.check,
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Get.to(ImageUploadScreen());
            },
          )
        ],
      ),
      body: NotificationListener<ScrollNotification>(
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
      ),
    );
  }
}
