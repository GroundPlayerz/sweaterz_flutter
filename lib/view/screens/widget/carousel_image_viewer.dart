import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sweaterz_flutter/view/screens/photo_view_gallery_screen.dart';

class CarouselImageViewer extends StatelessWidget {
  const CarouselImageViewer({
    Key? key,
    required Map postData,
  })   : _postData = postData,
        super(key: key);

  final Map _postData;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        options: CarouselOptions(
          aspectRatio: 1,
          //height: 300.0,
          enableInfiniteScroll: false,
        ),
        itemCount: _postData['file_list'].length,
        itemBuilder: (context, index, _) {
          Map fileData = _postData['file_list'][index];
          return Builder(
            builder: (context) {
              return Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(color: Colors.white),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PhotoViewGalleryScreen(
                                    fileList: _postData['file_list'],
                                    firstPage: index,
                                  )));
                    },
                    child: CachedNetworkImage(
                      imageUrl: fileData['download_url'],
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      fit: BoxFit.cover,
                    ),
                  ));
            },
          );
        });
  }
}
