import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sweaterz_flutter/networking_api/login_api.dart';
import 'package:sweaterz_flutter/view/constants/constants.dart';
import 'package:chewie/chewie.dart';
import 'package:sweaterz_flutter/view/screens/components/rounded_color_button.dart';
import 'package:sweaterz_flutter/view/screens/components/video_item.dart';
import 'package:video_player/video_player.dart';

class VideoUploadScreen extends StatefulWidget {
  final videoFile;
  VideoUploadScreen({this.videoFile});
  @override
  _VideoUploadScreenState createState() => _VideoUploadScreenState();
}

class _VideoUploadScreenState extends State<VideoUploadScreen> {
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;
  File _video;

  @override
  void initState() {
    // TODO: implement initState
    getVideo();
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  Future<void> getVideo() async {
    setState(() {
      _video = widget.videoFile;
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
            if (_video != null) {
              _videoPlayerController = VideoPlayerController.file(_video);
              Future.microtask(() async {
                await _videoPlayerController.initialize();
              });
              _chewieController = ChewieController(
                videoPlayerController: _videoPlayerController,
                autoPlay: false,
                looping: false,
                aspectRatio: 16 / 9,
              );
            }
            return _video != null
                ? Padding(
                    padding: EdgeInsets.all(10),
                    child: Chewie(
                      controller: _chewieController,
                    ),
                  )
                : Text('No Video');
          }),
          roundedColorButton(
              textContent: 'Video', isButtonEnabled: true, onPressed: getVideo),
        ],
      )),
    );
  }
}