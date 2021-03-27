import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:sweaterz_flutter/view/constants/constants.dart';
import 'package:chewie/chewie.dart';
import 'package:sweaterz_flutter/view/screens/components/rounded_color_button.dart';
import 'package:sweaterz_flutter/view/screens/components/video_item.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer extends StatefulWidget {
  final String videoDownloadURL;

  VideoPlayer({this.videoDownloadURL});

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController =
        VideoPlayerController.network(widget.videoDownloadURL);

    await Future.wait([
      _videoPlayerController.initialize(),
    ]);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: false,
      looping: true,
      // Try playing around with some of these other options:

      // showControls: false,
      // materialProgressColors: ChewieProgressColors(
      //   playedColor: Colors.red,
      //   handleColor: Colors.blue,
      //   backgroundColor: Colors.grey,
      //   bufferedColor: Colors.lightGreen,
      // ),
      // placeholder: Container(
      //   color: Colors.grey,
      // ),
      // autoInitialize: true,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Center(
            child: _chewieController != null &&
                    _chewieController.videoPlayerController.value.initialized
                ? Chewie(
                    controller: _chewieController,
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      SizedBox(height: 20),
                      Text('Loading'),
                    ],
                  ),
          ),
        ),
        TextButton(
          onPressed: () {
            _chewieController.enterFullScreen();
          },
          child: const Text('Fullscreen'),
        ),
        Expanded(
          child: TextButton(
            onPressed: () {
              setState(() {
                _chewieController?.dispose();
                _videoPlayerController.pause();
                _videoPlayerController.seekTo(const Duration());
                _chewieController = ChewieController(
                  videoPlayerController: _videoPlayerController,
                  autoPlay: true,
                  looping: true,
                );
              });
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text("Landscape Video"),
            ),
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _platform = TargetPlatform.android;
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text("Android controls"),
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _platform = TargetPlatform.iOS;
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text("iOS controls"),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
