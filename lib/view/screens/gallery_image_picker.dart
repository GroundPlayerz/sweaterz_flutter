import 'package:flutter/material.dart';
import 'package:sweaterz_flutter/view/constants/constants.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '../constants/extensions.dart';
import '../constants/picker_model.dart';
import 'package:sweaterz_flutter/main.dart';

import 'components/rounded_outlined_button.dart';

class GalleryImagePicker extends StatefulWidget {
  @override
  _GalleryImagePickerState createState() => _GalleryImagePickerState();
}

class _GalleryImagePickerState extends State<GalleryImagePicker> {
  final TextEditingController contentsController = TextEditingController();
  bool _isNextButtonEnabled = false;

  final int maxAssetsCount = 9;

  List<AssetEntity> assets = <AssetEntity>[];

  bool isDisplayingDetail = true;

  int get assetsLength => assets.length;

  ThemeData get currentTheme => context.themeData;

  List<PickMethodModel> get pickMethods => <PickMethodModel>[
        PickMethodModel(
          icon: '🖼️',
          name: 'Image picker',
          description: 'Simply pick image from device.',
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
        ),
      ];

  Future<void> selectAssets(PickMethodModel model) async {
    final List<AssetEntity> result = await model.method(context, assets);
    if (result != null) {
      assets = List<AssetEntity>.from(result);
      if (mounted) {
        setState(() {});
      }
    }
  }

  Future<void> methodWrapper(PickMethodModel model) async {
    assets = List<AssetEntity>.from(
      await model.method(context, assets),
    );
    if (mounted) {
      setState(() {});
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

  Widget methodItemBuilder(BuildContext _, int index) {
    final PickMethodModel model = pickMethods[index];
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
      child: Text('Select Images'),
    );
  }

  Widget _assetWidgetBuilder(AssetEntity asset) {
    Widget widget;
    switch (asset.type) {
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
                    const Text('Selected Images'),
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Upload Image Post',
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
                    onPressed: () {},
                  )))
        ],
        actionsIconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 300,
            child: TextField(
              // ToDO 아래 줄 어케지우는지 몰겠음;;
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Write description',
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
          ),
          kUploadDivider,
          Container(
            height: 70,
          ),
          kUploadDivider,
          Container(
            height: 70,
          ),
          kUploadDivider,
          methodItemBuilder(context, 0),
          selectedAssetsWidget,
        ],
      ),
    );
  }
}
