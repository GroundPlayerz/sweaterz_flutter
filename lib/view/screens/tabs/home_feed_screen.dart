import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sweaterz_flutter/view/constants/constants.dart';
import 'package:sweaterz_flutter/view/screens/provider/home_feed_provider.dart';
import 'package:sweaterz_flutter/view/screens/tabs/images_type_upload.dart';
import 'package:sweaterz_flutter/view/screens/tabs/text_type_upload.dart';
import 'package:sweaterz_flutter/view/screens/tabs/video_type_upload.dart';

class HomeFeedScreen extends StatefulWidget {
  @override
  _HomeFeedScreenState createState() => _HomeFeedScreenState();
}

class _HomeFeedScreenState extends State<HomeFeedScreen> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<HomeFeedProvider>(context, listen: false)
        .fetchNewPostWidget(context);
    addListenerToScrollController(context);
  }

  addListenerToScrollController(BuildContext context) {
    _scrollController.addListener(() {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double currentScroll = _scrollController.position.pixels;
      double delta = MediaQuery.of(context).size.height * 0.20;
      if (maxScroll - currentScroll <= delta) {
        Provider.of<HomeFeedProvider>(context, listen: false)
            .fetchNewPostWidget(context);
      }
    });
  }

  Future<void> _onRefresh() async {
    // monitor network fetch
    Provider.of<HomeFeedProvider>(context, listen: false)
        .initializePostWidgetList();
    Provider.of<HomeFeedProvider>(context, listen: false)
        .fetchNewPostWidget(context);
    // if failed,use refreshFailed()
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeFeedProvider =
        Provider.of<HomeFeedProvider>(context, listen: true);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackgroundGreyColor,
      appBar: AppBar(
        backgroundColor: kBackgroundGreyColor,
        elevation: 0,
        iconTheme: IconThemeData(color: kIconGreyColor2_656565),
        leading: IconButton(
          icon: Icon(CupertinoIcons.search),
          onPressed: () {},
        ),
        // leadingWidth: 200,
        // leading: SizedBox(
        //   width: 200,
        //   child: Padding(
        //     padding: EdgeInsets.only(left: 10.0),
        //     child: Image(
        //       image: AssetImage('images/logo_small@3x.png'),
        //       fit: BoxFit.fitWidth,
        //     ),
        //   ),
        // ),
        //로고

        actions: [
          IconButton(
            icon: Icon(Icons.add_box_outlined),
            onPressed: () {
              List<String> bottomSheetList = ['Video', 'Image', 'Only Text'];

              showModalBottomSheet(
                isDismissible: true,
                context: context,
                builder: (context) {
                  return Container(
                    height: 180,
                    child: ListView.builder(
                        itemCount: 3,
                        itemBuilder: (context, listViewIdx) {
                          return ListTile(
                            onTap: () {
                              // Navigator.pop(context);
                              if (listViewIdx == 0) {
                                Get.to(() => VideoTypeUpload(),
                                    transition: Transition.downToUp);
                              } else if (listViewIdx == 1) {
                                Get.to(() => ImagesTypeUpload(),
                                    transition: Transition.downToUp);
                              } else {
                                Get.to(() => TextTypeUpload(),
                                    transition: Transition.downToUp);
                              }
                            },
                            title: Text(bottomSheetList[listViewIdx]),
                          );
                        }),
                  );
                },
              );
            },
          ),
          IconButton(
            icon: Icon(CupertinoIcons.archivebox_fill),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.chat_bubble_outline),
            onPressed: () {},
          ),
        ],
        //actionsIconTheme: IconThemeData(color: kIconGreyColor2_656565),
        //shadowColor: Colors.white.withOpacity(0.0),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Text(
            //     '${Provider.of<MemberProvider>(context).email} has logged in'),
            // Text(Provider.of<MemberProvider>(context).profileName),
            Expanded(
                child: homeFeedProvider.postWidgetList.length == 0
                    //ToDO 피드가 없어도 새로고침 될 수 있게 스크롤 가능하게 해야함.
                    ? Center(
                        child: Text('Loading...'),
                      )
                    : RefreshIndicator(
                        onRefresh: _onRefresh,
                        child: ListView.builder(
                          controller: _scrollController,
                          itemCount: homeFeedProvider.postWidgetList.length + 1,
                          itemBuilder: (context, index) {
                            if (index ==
                                homeFeedProvider.postWidgetList.length) {
                              return Container(
                                height: 30.0,
                                width: double.infinity,
                              );
                            }
                            return homeFeedProvider.postWidgetList[index];
                          },
                        ),
                      )),
          ],
        ),
      ),
    );
  }
}
