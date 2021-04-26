import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sweaterz_flutter/networking_service/upload_post_service.dart';
import 'package:sweaterz_flutter/view/constants/constants.dart';
import 'package:sweaterz_flutter/view/constants/text_styles.dart';
import 'package:sweaterz_flutter/view/screens/provider/user_provider.dart';
import 'package:sweaterz_flutter/view/model/post.dart';
import 'package:sweaterz_flutter/view/screens/components/dialog.dart';
import 'package:sweaterz_flutter/view/screens/post_sports_add_screen.dart';
import 'package:sweaterz_flutter/view/screens/post_tags_add_screen.dart';
import 'package:sweaterz_flutter/view/screens/tabs/home_root.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '../../constants/extensions.dart';
import '../../constants/picker_model.dart';

import '../components/rounded_outlined_button.dart';

class ImagesTypeUpload extends StatefulWidget {
  @override
  _ImagesTypeUploadState createState() => _ImagesTypeUploadState();
}

class _ImagesTypeUploadState extends State<ImagesTypeUpload> {
  final TextEditingController contentsController = TextEditingController();
  FocusNode? myFocusNode;
  String? addedSports;
  List<String> addedTagsList = [];
  bool isQuestion = false;

  final int maxAssetsCount = 9;

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
            requestType: RequestType.image,
            pickerTheme: kAssetsPickerThemeData,
            textDelegate: EnglishTextDelegate(),
          );
        },
      );

  Widget _selectImagesButton(BuildContext context) {
    final PickMethodModel model = pickMethod;
    return TextButton(
      onPressed: () async {
        myFocusNode?.unfocus();
        final List<AssetEntity>? result = await model.method(context, assets);
        if (result != null && result != assets) {
          assets = List<AssetEntity>.from(result);
          if (mounted) {
            setState(() {});
          }
        }
      },
      child: Text('Select Images'),
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
    Widget widget = _imageAssetWidget(asset);

    return widget;
  }

  Widget _imageAssetWidget(AssetEntity asset) {
    return Image(
      image: AssetEntityImageProvider(asset, isOriginal: false),
      fit: BoxFit.cover,
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

  Widget get _selectedAssetsWidget => AnimatedContainer(
        duration: kThemeChangeDuration,
        curve: Curves.easeInOut,
        height: assets.isNotEmpty
            ? isDisplayingDetail
                ? 120.0
                : 80.0
            : 40.0,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
                      // mainAxisAlignment: MainAxisAlignment.,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                          ),
                          padding: const EdgeInsets.all(4.0),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey,
                          ),
                          child: Text(
                            '${assets.length}',
                            style: const TextStyle(
                              color: Colors.white,
                              height: 1.0,
                            ),
                          ),
                        ),
                        if (assets.isNotEmpty)
                          Icon(
                            isDisplayingDetail
                                ? Icons.arrow_downward
                                : Icons.arrow_upward,
                            size: 18.0,
                          ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            selectedAssetsListView,
          ],
        ),
      );

  Widget get selectedAssetsListView => Expanded(
        child: ListView.builder(
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
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    myFocusNode?.unfocus();
    myFocusNode?.dispose();
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
  // ToDo flutter_image_compressor 패키지 이용하여 이미지 파일 압축하기, path_provider의 getTemporarayPath 이용!
  // Future<File> compressAndGetFile(File file) async {
  //   File result = await FlutterNativeImage.compressImage(
  //     file.absolute.path,
  //     quality: 70,
  //   );
  //   print(result);
  //
  //   print('Original File Size: ' + file.lengthSync().toString());
  //   print('Compressed File Size: ' + result.lengthSync().toString());
  //
  //   return result;
  // }

  AppBar _imagesTypeUploadScreenAppBar(BuildContext context) => AppBar(
        backgroundColor: kBackgroundWhiteColor,
        elevation: 0.0,
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
                    List<File> imageFileList = [];
                    for (AssetEntity asset in assets) {
                      File? file = await asset.originFile;
                      //ToDo image 파일 압축하
                      // File compressedFile = await compressAndGetFile(file);
                      imageFileList.add(file!);
                    }
                    Post newPost = Post();
                    newPost.setForUpload(
                      isQuestion: isQuestion,
                      contentsController: contentsController,
                      addedSports: addedSports!,
                      addedTagsList: addedTagsList,
                      uploadType: 'images',
                      imageFileList: imageFileList,
                      profileName:
                          Provider.of<UserProvider>(context, listen: false)
                              .profileName!,
                      profilePhotoUrl:
                          Provider.of<UserProvider>(context, listen: false)
                              .profilePhotoURL!,
                      memberEmail:
                          Provider.of<UserProvider>(context, listen: false)
                              .email!,
                    );
                    UploadPostService().uploadImagesTypePost(newPost);
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

  Widget _imagesTypeUploadScreenContentArea(BuildContext context) => Container(
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

  Widget get _imagesTypeUploadScreenSportsArea => Container(
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

  Widget get _imagesTypeUploadScreenHashTagsArea => Container(
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
                          if (addedTagsList.length != 0)
                            for (String tag in addedTagsList)
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.0),
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
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundWhiteColor,
      appBar: _imagesTypeUploadScreenAppBar(context),
      body: GestureDetector(
        onTap: () {
          myFocusNode?.unfocus();
        },
        child: ListView(
          children: <Widget>[
            _imagesTypeUploadScreenContentArea(context),
            kDivider,
            _imagesTypeUploadScreenSportsArea,
            kDivider,
            _imagesTypeUploadScreenHashTagsArea,
            kDivider,
            Row(
              children: [
                _selectImagesButton(context),
              ],
            ),
            _selectedAssetsWidget,
            kDivider,
            _postWithQuestionMark,
          ],
        ),
      ),
    );
  }
}
