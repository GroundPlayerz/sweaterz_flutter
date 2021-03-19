import 'package:flutter/material.dart';
import 'package:sweaterz_flutter/view/constants/constants.dart';
import 'package:sweaterz_flutter/view/screens/components/rounded_outlined_button.dart';

import '../gallery_image_picker.dart';
import '../gallery_video_picker.dart';

class UploadScreen extends StatefulWidget {
  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final PageController controller = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    controller.addListener(pageControllerListener);
    super.initState();
  }

  void selectIndex(int index) {
    if (index == currentIndex) {
      return;
    }
    controller.animateToPage(
      index,
      duration: kThemeAnimationDuration,
      curve: Curves.easeInOut,
    );
  }

  void pageControllerListener() {
    final int currentPage = controller.page.round();
    if (currentPage != currentIndex) {
      currentIndex = currentPage;
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        title: currentIndex == 0
            ? Text(
                'Upload Image Post',
                style: kBodyTextStyle1M.copyWith(color: Colors.black),
              )
            : Text(
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
                      textContent: 'Next', onPressed: null)))
        ],
        actionsIconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView(
                controller: controller,
                children: <Widget>[
                  GalleryImagePicker(),
                  GalleryVideoPicker(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: selectIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library),
            // ignore: deprecated_member_use
            title: Text('Image'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ondemand_video),
            // ignore: deprecated_member_use
            title: Text('Video'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
