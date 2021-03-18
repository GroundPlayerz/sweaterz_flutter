import 'package:flutter/material.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class PickMethodModel {
  const PickMethodModel({
    @required this.icon,
    @required this.name,
    @required this.description,
    @required this.method,
  });

  final String icon;
  final String name;
  final String description;
  final Future<List<AssetEntity>> Function(BuildContext, List<AssetEntity>)
      method;

  static PickMethodModel common = PickMethodModel(
    icon: '🖼️',
    name: 'Image picker',
    description: 'Simply pick image from device.',
    method: (
      BuildContext context,
      List<AssetEntity> assets,
    ) async {
      return await AssetPicker.pickAssets(
        context,
        maxAssets: 9,
        pathThumbSize: 84,
        gridCount: 4,
        selectedAssets: assets,
        requestType: RequestType.image,
      );
    },
  );
}
