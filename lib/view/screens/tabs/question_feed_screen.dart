import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweaterz_flutter/view/constants/constants.dart';
import 'package:sweaterz_flutter/view/screens/provider/question_feed_provider.dart';

class QuestionFeedScreen extends StatefulWidget {
  @override
  _QuestionFeedScreenState createState() => _QuestionFeedScreenState();
}

class _QuestionFeedScreenState extends State<QuestionFeedScreen> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<QuestionFeedProvider>(context, listen: false)
        .fetchNewPostWidget(context);
    addListenerToScrollController(context);
  }

  addListenerToScrollController(BuildContext context) {
    _scrollController.addListener(() {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double currentScroll = _scrollController.position.pixels;
      double delta = MediaQuery.of(context).size.height * 0.20;
      if (maxScroll - currentScroll <= delta) {
        Provider.of<QuestionFeedProvider>(context, listen: false)
            .fetchNewPostWidget(context);
      }
    });
  }

  Future<void> _onRefresh() async {
    // monitor network fetch
    Provider.of<QuestionFeedProvider>(context, listen: false)
        .initializePostWidgetList();
    Provider.of<QuestionFeedProvider>(context, listen: false)
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
    final questionFeedProvider =
        Provider.of<QuestionFeedProvider>(context, listen: true);
    // var mediaQuery = MediaQuery.of(context);
    // double convertHeightRatio = mediaQuery.size.height / kIphoneXHeight;
    // double convertWidthRatio = mediaQuery.size.width / kIphoneXWidth;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackgroundGreyColor,
      appBar: AppBar(
        backgroundColor: kBackgroundGreyColor,
        elevation: 0,

        leadingWidth: 45,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Container(
            width: 20,
            child: Image(
              image: AssetImage('images/question_mark_big@3x.png'),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        //로고
        title: Text(
          'Waiting for Answer',
          style: TextStyle(
            fontFamily: 'Open_Sans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
            color: Colors.black,
          ),
        ),
        // titleTextStyle: const TextStyle(
        //   fontFamily: 'Open_Sans',
        //   fontSize: 20,
        //   fontWeight: FontWeight.bold,
        //   letterSpacing: -0.5,
        //   color: Colors.black,
        // ).copyWith(color: Colors.black),
        //shadowColor: Colors.white.withOpacity(0.0),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Text(
            //     '${Provider.of<MemberProvider>(context).email} has logged in'),
            // Text(Provider.of<MemberProvider>(context).profileName),
            Expanded(
                //ToDO 피드가 없어도 새로고침 될 수 있게 스크롤 가능하게 해야함.
                child: questionFeedProvider.postWidgetList.length == 0
                    ? Center(
                        child: Text('No Data ...'),
                      )
                    : RefreshIndicator(
                        onRefresh: _onRefresh,
                        child: ListView.builder(
                          controller: _scrollController,
                          itemCount: questionFeedProvider.postWidgetList.length,
                          itemBuilder: (context, index) {
                            return questionFeedProvider.postWidgetList[index];
                          },
                        ),
                      )),
          ],
        ),
      ),
    );
  }
}
