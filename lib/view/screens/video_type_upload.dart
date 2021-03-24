import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sweaterz_flutter/networking_api/upload_post_api.dart';
import 'package:sweaterz_flutter/view/constants/constants.dart';
import 'package:sweaterz_flutter/view/model/member_provider.dart';
import 'package:sweaterz_flutter/view/model/post.dart';
import 'package:sweaterz_flutter/view/screens/post_sports_add_screen.dart';
import 'package:sweaterz_flutter/view/screens/post_tags_add_screen.dart';
import 'package:sweaterz_flutter/view/screens/tabs/home_root.dart';
import 'package:video_compress/video_compress.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '../constants/extensions.dart';
import '../constants/picker_model.dart';
import 'package:sweaterz_flutter/main.dart';

import 'components/alert_dialog.dart';
import 'components/rounded_outlined_button.dart';

class VideoTypeUpload extends StatefulWidget {
  @override
  _VideoTypeUploadState createState() => _VideoTypeUploadState();
}

class _VideoTypeUploadState extends State<VideoTypeUpload> {
  final TextEditingController contentsController = TextEditingController();
  FocusNode myFocusNode;
  List<String> addedSportsList = [];
  List<String> addedTagsList = [];
  Subscription _progressSubscription;
  IVideoCompress videoCompress = VideoCompress;

  final int maxAssetsCount = 1;

  List<AssetEntity> assets = <AssetEntity>[];

  bool isDisplayingDetail = true;

  int get assetsLength => assets.length;

  ThemeData get currentTheme => context.themeData;

  PickMethodModel get pickMethod => PickMethodModel(
        method: (
          BuildContext context,
          List<AssetEntity> assets,
        ) async {
          return await AssetPicker.pickAssets(
            context,
            maxAssets: maxAssetsCount,
            selectedAssets: assets,
            requestType: RequestType.video,
            pickerTheme: kAssetsPickerThemeData,
            textDelegate: EnglishTextDelegate(),
          );
        },
      );

  Widget methodItemBuilder(BuildContext context) {
    final PickMethodModel model = pickMethod;
    return TextButton(
      onPressed: () async {
        final List<AssetEntity> result = await model.method(context, assets);
        if (result != null && result != assets) {
          assets = List<AssetEntity>.from(result);
          if (mounted) {
            setState(() {});
          }
        }
      },
      child: Text('Select Video'),
    );
  }

  Future<void> selectAssets(PickMethodModel model) async {
    final List<AssetEntity> result = await model.method(context, assets);
    if (result != null) {
      assets = List<AssetEntity>.from(result);
      if (mounted) {
        setState(() {});
      }
    }
  }

  void removeAsset(int index) {
    setState(() {
      assets.remove(assets.elementAt(index));
      if (assets.isEmpty) {
        isDisplayingDetail = false;
      }
    });
  }

  Widget _assetWidgetBuilder(AssetEntity asset) {
    Widget widget;
    switch (asset.type) {
      case AssetType.audio:
        break;
      case AssetType.video:
        widget = _videoAssetWidget(asset);
        break;
      case AssetType.image:
      case AssetType.other:
        widget = _imageAssetWidget(asset);
        break;
    }
    return widget;
  }

  Widget _imageAssetWidget(AssetEntity asset) {
    return Image(
      image: AssetEntityImageProvider(asset, isOriginal: false),
      fit: BoxFit.cover,
    );
  }

  Widget _videoAssetWidget(AssetEntity asset) {
    return Stack(
      children: <Widget>[
        Positioned.fill(child: _imageAssetWidget(asset)),
        ColoredBox(
          color: context.themeData.dividerColor.withOpacity(0.3),
          child: Center(
            child: Icon(
              Icons.video_library,
              color: Colors.white,
              size: isDisplayingDetail ? 24.0 : 16.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget _selectedAssetWidget(int index) {
    final AssetEntity asset = assets.elementAt(index);
    return GestureDetector(
      onTap: isDisplayingDetail
          ? () async {
              final List<AssetEntity> result =
                  await AssetPickerViewer.pushToViewer(
                context,
                currentIndex: index,
                assets: assets,
                themeData: AssetPicker.themeData(kSweaterzColor),
              );
              if (result != assets && result != null) {
                assets = List<AssetEntity>.from(result);
                if (mounted) {
                  setState(() {});
                }
              }
            }
          : null,
      child: RepaintBoundary(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: _assetWidgetBuilder(asset),
        ),
      ),
    );
  }

  Widget _selectedAssetDeleteButton(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          assets.remove(assets.elementAt(index));
          if (assetsLength == 0) {
            isDisplayingDetail = false;
          }
        });
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: currentTheme.canvasColor.withOpacity(0.5),
        ),
        child: Icon(
          Icons.close,
          color: currentTheme.iconTheme.color,
          size: 18.0,
        ),
      ),
    );
  }

  Widget _selectedSportsDeleteButton(sport) {
    return GestureDetector(
      onTap: () {
        setState(() {
          addedSportsList.remove(sport);
        });
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: currentTheme.canvasColor.withOpacity(0.5),
        ),
        child: Icon(
          Icons.close,
          color: currentTheme.iconTheme.color,
          size: 18.0,
        ),
      ),
    );
  }

  Widget _selectedTagsDeleteButton(tag) {
    return GestureDetector(
      onTap: () {
        setState(() {
          addedTagsList.remove(tag);
        });
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: Colors.white.withOpacity(0.5),
        ),
        child: Icon(
          Icons.close,
          color: Colors.black,
          size: 18.0,
        ),
      ),
    );
  }

  Widget get selectedAssetsWidget => AnimatedContainer(
        duration: kThemeChangeDuration,
        curve: Curves.easeInOut,
        height: assets.isNotEmpty
            ? isDisplayingDetail
                ? 120.0
                : 80.0
            : 40.0,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
              child: GestureDetector(
                onTap: () {
                  if (assets.isNotEmpty) {
                    setState(() {
                      isDisplayingDetail = !isDisplayingDetail;
                    });
                  }
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    if (assets.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Icon(
                          isDisplayingDetail
                              ? Icons.arrow_downward
                              : Icons.arrow_upward,
                          size: 18.0,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            selectedAssetsListView,
          ],
        ),
      );

  Widget get selectedAssetsListView => Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          scrollDirection: Axis.horizontal,
          itemCount: assetsLength,
          itemBuilder: (BuildContext _, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 16.0,
              ),
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(child: _selectedAssetWidget(index)),
                    AnimatedPositioned(
                      duration: kThemeAnimationDuration,
                      top: isDisplayingDetail ? 6.0 : -30.0,
                      right: isDisplayingDetail ? 6.0 : -30.0,
                      child: _selectedAssetDeleteButton(index),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
  @override
  void initState() {
    // TODO: implement initState
    myFocusNode = FocusNode();
    _progressSubscription =
        videoCompress.compressProgress$.subscribe((progress) {
      debugPrint('progress: $progress');
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    myFocusNode.unfocus();
    myFocusNode.dispose();
    _progressSubscription.unsubscribe();
    super.dispose();
  }

  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: new Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              new CircularProgressIndicator(),
              new Text("Uploading... It can take few seconds"),
            ],
          ),
        );
      },
    );
  }

  Future<MediaInfo> compressVideoFileAndGetMediaInfo(File file) async {
    MediaInfo mediaInfo = await videoCompress.compressVideo(file.path,
        quality: VideoQuality.DefaultQuality, deleteOrigin: false);

    print('Original File Size: ' + file.lengthSync().toString());
    print('Compressed File Size: ' + mediaInfo.filesize.toString());

    return mediaInfo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Upload Video Post',
          style: kBodyTextStyle1M.copyWith(color: Colors.black),
        ),
        actions: [
          SizedBox(
            width: 90.0,
            height: 40.0,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: roundedOutlinedButton(
                textContent: 'Next',
                onPressed: () async {
                  if (assets.isNotEmpty &&
                      contentsController.text.length != 0 &&
                      addedSportsList.isNotEmpty &&
                      addedTagsList.isNotEmpty) {
                    _onLoading();
                    List<File> videoFileList = [];
                    for (AssetEntity asset in assets) {
                      File file = await asset.originFile;
                      try {
                        MediaInfo compressedMediaInfo =
                            await compressVideoFileAndGetMediaInfo(file);
                        File compressedFile = compressedMediaInfo.file;
                        videoFileList.add(compressedFile);
                      } catch (e) {
                        videoCompress.cancelCompression();
                        print(e);
                      }
                    }
                    Post newPost = Post();
                    newPost.setForUpload(
                      contentsController: contentsController,
                      addedSportsList: addedSportsList,
                      addedTagsList: addedTagsList,
                      uploadType: 'video',
                      fileList: videoFileList,
                      profileName:
                          Provider.of<MemberProvider>(context, listen: false)
                              .profileName,
                      profilePhotoUrl:
                          Provider.of<MemberProvider>(context, listen: false)
                              .profilePhotoURL,
                      memberEmail:
                          Provider.of<MemberProvider>(context, listen: false)
                              .email,
                    );
                    await UploadPostAPI().uploadPost(newPost);
                    Navigator.pop(context);
                    Get.off(() => HomeRoot());
                  } else {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return uploadAlertDialog(context);
                        });
                  }
                },
              ),
            ),
          ),
        ],
        actionsIconTheme: IconThemeData(color: Colors.black),
      ),
      body: GestureDetector(
        onTap: () {
          myFocusNode.unfocus();
        },
        child: ListView(
          children: <Widget>[
            Container(
              height: 300,
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: TextField(
                  controller: contentsController,
                  focusNode: myFocusNode,
                  autofocus: false,
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Write description',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
              ),
            ),
            kUploadDivider,
            Container(
              height: 90,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Sports',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 10.0, right: 10.0, bottom: 10.0),
                        child: Text('What kinds of sports are you playing?'),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () async {
                          myFocusNode.unfocus();
                          final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PostSportsAddScreen(
                                    addedSportsList: addedSportsList),
                              ));
                          setState(() {
                            if (result != null) {
                              addedSportsList = result;
                            }
                          });
                        },
                        child: Text('+ Add'),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          dragStartBehavior: DragStartBehavior.start,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (addedSportsList != null)
                                if (addedSportsList.length != 0)
                                  for (String sport in addedSportsList)
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5.0),
                                      child: Stack(children: [
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                                vertical: 10.0),
                                            child: Text(
                                              sport,
                                              style: TextStyle(fontSize: 16.0),
                                            )),
                                        AnimatedPositioned(
                                          duration: kThemeAnimationDuration,
                                          top: -3.0,
                                          right: -3.0,
                                          child: _selectedSportsDeleteButton(
                                              sport),
                                        ),
                                      ]),
                                    ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            kUploadDivider,
            //여기서부터 Tags
            Container(
              height: 90,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Hashtags',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 10.0, right: 10.0, bottom: 10.0),
                        child: Text('Categorize your post with hastags'),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () async {
                          myFocusNode.unfocus();
                          final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PostTagsAddScreen(
                                    addedTagsList: addedTagsList),
                              ));
                          setState(() {
                            if (result != null) {
                              addedTagsList = result;
                            }
                          });
                        },
                        child: Text('+ Add'),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          dragStartBehavior: DragStartBehavior.start,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (addedTagsList != null)
                                if (addedTagsList.length != 0)
                                  for (String tag in addedTagsList)
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5.0),
                                      child: Stack(children: [
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                                vertical: 10.0),
                                            child: Text(
                                              tag,
                                              style: TextStyle(fontSize: 16.0),
                                            )),
                                        AnimatedPositioned(
                                          duration: kThemeAnimationDuration,
                                          top: -3.0,
                                          right: -3.0,
                                          child: _selectedTagsDeleteButton(tag),
                                        ),
                                      ]),
                                    ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            kUploadDivider,
            Row(
              children: [
                methodItemBuilder(context),
              ],
            ),
            selectedAssetsWidget,
          ],
        ),
      ),
    );
  }
}
