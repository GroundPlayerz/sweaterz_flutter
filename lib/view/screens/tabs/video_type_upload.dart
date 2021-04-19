import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sweaterz_flutter/networking_service/upload_post_service.dart';
import 'package:sweaterz_flutter/view/constants/constants.dart';
import 'package:sweaterz_flutter/view/constants/text_styles.dart';
import 'package:sweaterz_flutter/view/screens/provider/member_provider.dart';
import 'package:sweaterz_flutter/view/model/post.dart';
import 'package:sweaterz_flutter/view/screens/post_sports_add_screen.dart';
import 'package:sweaterz_flutter/view/screens/post_tags_add_screen.dart';
import 'package:sweaterz_flutter/view/screens/tabs/home_root.dart';
import 'package:video_compress/video_compress.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '../../constants/extensions.dart';
import '../../constants/picker_model.dart';

import '../components/dialog.dart';
import '../components/rounded_outlined_button.dart';

class VideoTypeUpload extends StatefulWidget {
  @override
  _VideoTypeUploadState createState() => _VideoTypeUploadState();
}

class _VideoTypeUploadState extends State<VideoTypeUpload> {
  final TextEditingController contentsController = TextEditingController();
  FocusNode? myFocusNode;
  String? addedSports;
  List<String> addedTagsList = [];
  Subscription? _progressSubscription;
  IVideoCompress videoCompress = VideoCompress;
  bool isQuestion = false;

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

  Widget _selectVideoButton(BuildContext context) {
    final PickMethodModel model = pickMethod;
    return TextButton(
      onPressed: () async {
        final List<AssetEntity>? result = await model.method(context, assets);
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
    final List<AssetEntity>? result = await model.method(context, assets);
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
    Widget widget = _videoAssetWidget(asset);

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
              final List<AssetEntity>? result =
                  await AssetPickerViewer.pushToViewer(
                context,
                currentIndex: index,
                previewAssets: assets,
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
          addedSports = null;
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
    myFocusNode?.unfocus();
    myFocusNode?.dispose();
    _progressSubscription?.unsubscribe();
    super.dispose();
  }

  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return uploadingDialog();
      },
    );
  }

  Future<MediaInfo?> compressVideoFileAndGetMediaInfo(File file) async {
    MediaInfo? mediaInfo = await videoCompress.compressVideo(file.path,
        quality: VideoQuality.DefaultQuality, deleteOrigin: false);

    if (mediaInfo != null) {
      print('Original File Size: ' + file.lengthSync().toString());
      print('Compressed File Size: ' + mediaInfo.filesize.toString());

      return mediaInfo;
    }
  }

  Future<File> getVideoThumbnailFile(File file) async {
    final thumbnailFile = await VideoCompress.getFileThumbnail(file.path,
        quality: 50, // default(100)
        position: -1 // default(-1)
        );

    return thumbnailFile;
  }

  AppBar _videoTypeUploadScreenAppBar(BuildContext context) => AppBar(
        elevation: 0.0,
        backgroundColor: kBackgroundWhiteColor,
        iconTheme: IconThemeData(
          color: kIconGreyColor1_B2B2B2, //change your color here
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
                      addedSports != null &&
                      addedTagsList.isNotEmpty) {
                    _onLoading();
                    List<Map> videoFileList = [];
                    for (AssetEntity asset in assets) {
                      File? file = await asset.originFile;
                      try {
                        if (file != null) {
                          MediaInfo? compressedMediaInfo =
                              await compressVideoFileAndGetMediaInfo(file);
                          File? compressedVideoFile = compressedMediaInfo!.file;
                          double? mediaLength = compressedMediaInfo.duration;
                          File videoThumbnailFile =
                              await getVideoThumbnailFile(file);
                          videoFileList.add({
                            'video_file': compressedVideoFile,
                            'thumbnail_file': videoThumbnailFile,
                            'media_length': mediaLength,
                          });
                        }
                      } catch (e) {
                        videoCompress.cancelCompression();
                        print(e);
                      }
                    }
                    Post newPost = Post();
                    newPost.setForUpload(
                      isQuestion: isQuestion,
                      contentsController: contentsController,
                      addedSports: addedSports!,
                      addedTagsList: addedTagsList,
                      uploadType: 'video',
                      videoFileList: videoFileList,
                      profileName:
                          Provider.of<MemberProvider>(context, listen: false)
                              .profileName!,
                      profilePhotoUrl:
                          Provider.of<MemberProvider>(context, listen: false)
                              .profilePhotoURL!,
                      memberEmail:
                          Provider.of<MemberProvider>(context, listen: false)
                              .email!,
                    );
                    UploadPostService().uploadVideoTypePost(newPost);
                    Future.delayed(Duration(seconds: 3));
                    Navigator.pop(context);
                    Get.off(() => HomeRoot());
                  } else {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return uploadScreeNextButtonAlertDialog(context);
                        });
                  }
                },
              ),
            ),
          ),
        ],
        actionsIconTheme: IconThemeData(color: Colors.black),
      );

  Widget _videoTypeUploadScreenContentArea(BuildContext context) => Container(
        height: 300,
        child: Padding(
          padding: EdgeInsets.fromLTRB(21, 10, 21, 21),
          child: TextField(
            cursorColor: kSweaterzColor,
            controller: contentsController,
            focusNode: myFocusNode,
            autofocus: false,
            style: kPostBodyTextStyle,
            decoration: kTextFieldDecoration.copyWith(
              hintText: 'Write description.',
              hintStyle: kPostBodyTextStyle.copyWith(color: kGreyColor1_767676),
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
      );

  Widget get _videoTypeUploadScreenSportsArea => Container(
        height: 90,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 21, top: 13, right: 0, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Sports',
                    style: kUploadScreenCategoryTextStyle,
                  ),
                  SizedBox(width: 18),
                  Text(
                    'What kinds of sports are you playing?',
                    style: kUploadScreenCategoryDetailTextStyle.copyWith(
                        color: kGreyColor1_767676),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 5,
                left: 12,
              ),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () async {
                      myFocusNode?.unfocus();
                      final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PostSportsAddScreen(addedSports: addedSports),
                          ));
                      setState(() {
                        if (result != null) {
                          addedSports = result;
                        }
                      });
                    },
                    child: Text(
                      '+ Add',
                      style: kUploadScreenAddButtonTextStyle.copyWith(
                          color: kGreyColor1_767676),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      dragStartBehavior: DragStartBehavior.start,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (addedSports != null)
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                              child: Stack(children: [
                                Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 10.0),
                                    child: Text(
                                      addedSports!,
                                      style: TextStyle(fontSize: 16.0),
                                    )),
                                AnimatedPositioned(
                                  duration: kThemeAnimationDuration,
                                  top: -3.0,
                                  right: -3.0,
                                  child:
                                      _selectedSportsDeleteButton(addedSports),
                                ),
                              ]),
                            ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );

  Widget get _videoTypeUploadScreenHashTagsArea => Container(
        height: 90,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 21, top: 13, right: 0, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Hashtags',
                    style: kUploadScreenCategoryTextStyle,
                  ),
                  SizedBox(width: 18),
                  Text(
                    'Categorize your post with hashtags.',
                    style: kUploadScreenCategoryDetailTextStyle.copyWith(
                        color: kGreyColor1_767676),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 5,
                left: 12,
              ),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () async {
                      myFocusNode?.unfocus();
                      final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PostTagsAddScreen(addedTagsList: addedTagsList),
                          ));
                      setState(() {
                        if (result != null) {
                          addedTagsList = result;
                        }
                      });
                    },
                    child: Text(
                      '+ Add',
                      style: kUploadScreenAddButtonTextStyle.copyWith(
                          color: kGreyColor1_767676),
                    ),
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
                                            horizontal: 10.0, vertical: 10.0),
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
            ),
          ],
        ),
      );

  Widget get _postWithQuestionMark => CheckboxListTile(
      title: Text('Post with question mark?'),
      value: isQuestion,
      onChanged: (value) {
        setState(() {
          isQuestion = value!;
        });
      });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundWhiteColor,
      appBar: _videoTypeUploadScreenAppBar(context),
      body: GestureDetector(
        onTap: () {
          myFocusNode?.unfocus();
        },
        child: ListView(
          children: <Widget>[
            _videoTypeUploadScreenContentArea(context),
            kDivider,
            _videoTypeUploadScreenSportsArea,
            kDivider,
            //여기서부터 Tags
            _videoTypeUploadScreenHashTagsArea,
            kDivider,
            Row(
              children: [
                _selectVideoButton(context),
              ],
            ),
            selectedAssetsWidget,
            kDivider,
            _postWithQuestionMark,
          ],
        ),
      ),
    );
  }
}
