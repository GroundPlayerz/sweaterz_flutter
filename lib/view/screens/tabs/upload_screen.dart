import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:sweaterz_flutter/networking_api/login_api.dart';
import 'package:sweaterz_flutter/view/constants.dart';
import 'package:chewie/chewie.dart';
import 'package:sweaterz_flutter/view/screens/components/rounded_color_button.dart';
import 'package:sweaterz_flutter/view/screens/components/video_item.dart';
import 'package:video_player/video_player.dart';

class UploadScreen extends StatefulWidget {
  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  List<File> _fileList = [];
  final picker = ImagePicker();

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _fileList.add(File(pickedFile.path));
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> getVideo() async {
    final pickedFile = await picker.getVideo(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _fileList.add(File(pickedFile.path));
      } else {
        print('No video selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Tab'),
      ),
      body: Center(
          child: Column(
        children: [
          Builder(builder: (context) {
            if (_fileList.length != null) {
              return Text('Select Images or Videos');
            } else {
              return ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    File file = _fileList[index];
                    String fileType =
                        lookupMimeType(file.toString()).split('/')[0];
                    print(fileType);
                    if (fileType == 'image') {
                      return Image.file(file);
                    } else {
                      return VideoItem(
                        videoPlayerController: VideoPlayerController.file(file),
                        autoplay: false,
                        looping: false,
                      );
                    }
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(),
                  itemCount: _fileList.length);
            }
          }),
          Column(
            children: [
              roundedColorButton(
                  textContent: 'Image',
                  isButtonEnabled: true,
                  onPressed: getImage),
              roundedColorButton(
                  textContent: 'Video',
                  isButtonEnabled: true,
                  onPressed: getVideo),
            ],
          )
        ],
      )),
    );
  }
}
