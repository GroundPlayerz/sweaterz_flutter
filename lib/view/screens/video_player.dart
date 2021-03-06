import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:sweaterz_flutter/view/constants/constants.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoViewer extends StatefulWidget {
  final String videoDownloadURL;
  final String thumbnailDownloadURL;

  VideoViewer(
      {required this.videoDownloadURL, required this.thumbnailDownloadURL});

  @override
  _VideoViewerState createState() => _VideoViewerState();
}

class _VideoViewerState extends State<VideoViewer> {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController =
        VideoPlayerController.network(widget.videoDownloadURL);

    await Future.wait([
      _videoPlayerController!.initialize(),
    ]);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController!,
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
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: _chewieController != null &&
                      _chewieController!
                          .videoPlayerController.value.isInitialized
                  ? Chewie(
                      controller: _chewieController!,
                    )
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          color: Colors.black12,
                        ),
                        Container(
                          // Show a light blue background before the image loads
                          child: CachedNetworkImage(
                            imageUrl: widget.thumbnailDownloadURL,
                            fit: BoxFit.cover,
                          ),
                        ),
                        CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(kSweaterzColor),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
