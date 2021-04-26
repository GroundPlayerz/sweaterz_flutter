import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sweaterz_flutter/networking_service/upload_post_service.dart';
import 'package:sweaterz_flutter/view/constants/constants.dart';
import 'package:sweaterz_flutter/view/constants/text_styles.dart';
import 'package:sweaterz_flutter/view/model/post.dart';
import 'package:sweaterz_flutter/view/screens/components/dialog.dart';
import 'package:sweaterz_flutter/view/screens/components/rounded_outlined_button.dart';
import 'package:sweaterz_flutter/view/screens/post_sports_add_screen.dart';
import 'package:sweaterz_flutter/view/screens/post_tags_add_screen.dart';
import 'package:sweaterz_flutter/view/screens/provider/user_provider.dart';
import 'package:sweaterz_flutter/view/screens/tabs/home_root.dart';

class TextTypeUpload extends StatefulWidget {
  @override
  _TextTypeUploadState createState() => _TextTypeUploadState();
}

class _TextTypeUploadState extends State<TextTypeUpload> {
  final TextEditingController contentsController = TextEditingController();
  FocusNode? myFocusNode;
  String? addedSports;
  List<String> addedTagsList = [];
  bool isQuestion = false;

  Widget _selectedSportsDeleteButton(sport) {
    return GestureDetector(
      onTap: () {
        setState(() {
          addedSports = null;
        });
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: Colors.white.withOpacity(0.5),
        ),
        child: Icon(
          Icons.close,
          color: Colors.black,
          size: 18.0,
        ),
      ),
    );
  }

  Widget _selectedTagsDeleteButton(tag) {
    return GestureDetector(
      onTap: () {
        setState(() {
          addedTagsList.remove(tag);
        });
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: Colors.white.withOpacity(0.5),
        ),
        child: Icon(
          Icons.close,
          color: Colors.black,
          size: 18.0,
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    myFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    myFocusNode?.unfocus();
    myFocusNode?.dispose();
    super.dispose();
  }

  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return uploadingDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundWhiteColor,
      appBar: AppBar(
        backgroundColor: kBackgroundWhiteColor,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: kIconGreyColor1_B2B2B2, //change your color here
        ),
        actions: [
          SizedBox(
            width: 90.0,
            height: 40.0,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: roundedOutlinedButton(
                textContent: 'Next',
                onPressed: () async {
                  if (contentsController.text.length != 0 &&
                      addedSports != null &&
                      addedTagsList.isNotEmpty) {
                    _onLoading();

                    Post newPost = Post();
                    newPost.setForUpload(
                      isQuestion: isQuestion,
                      contentsController: contentsController,
                      addedSports: addedSports!,
                      addedTagsList: addedTagsList,
                      uploadType: 'text',
                      profileName:
                          Provider.of<UserProvider>(context, listen: false)
                              .profileName!,
                      profilePhotoUrl:
                          Provider.of<UserProvider>(context, listen: false)
                              .profilePhotoURL!,
                      memberEmail:
                          Provider.of<UserProvider>(context, listen: false)
                              .email!,
                    );
                    UploadPostService().uploadTextTypePost(newPost);
                    Future.delayed(Duration(seconds: 3));
                    Navigator.pop(context);
                    Get.off(() => HomeRoot());
                  } else {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return uploadScreeNextButtonAlertDialog(context);
                        });
                  }
                },
              ),
            ),
          ),
        ],
        actionsIconTheme: IconThemeData(color: Colors.black),
      ),
      body: GestureDetector(
        onTap: () {
          myFocusNode?.unfocus();
        },
        child: ListView(
          children: <Widget>[
            Container(
              height: 300,
              child: Padding(
                padding: EdgeInsets.fromLTRB(21, 10, 21, 21),
                child: TextField(
                  cursorColor: kSweaterzColor,
                  controller: contentsController,
                  focusNode: myFocusNode,
                  autofocus: false,
                  style: kPostBodyTextStyle,
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Write description.',
                    hintStyle:
                        kPostBodyTextStyle.copyWith(color: kGreyColor1_767676),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
              ),
            ),
            kDivider,
            Container(
              height: 90,
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: 21, top: 13, right: 0, bottom: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Sports',
                          style: kUploadScreenCategoryTextStyle,
                        ),
                        SizedBox(width: 18),
                        Text(
                          'What kinds of sports are you playing?',
                          style: kUploadScreenCategoryDetailTextStyle.copyWith(
                              color: kGreyColor1_767676),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 5,
                      left: 12,
                    ),
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () async {
                            myFocusNode?.unfocus();
                            final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PostSportsAddScreen(
                                      addedSports: addedSports),
                                ));
                            setState(() {
                              if (result != null) {
                                addedSports = result;
                              }
                            });
                          },
                          child: Text(
                            '+ Add',
                            style: kUploadScreenAddButtonTextStyle.copyWith(
                                color: kGreyColor1_767676),
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            dragStartBehavior: DragStartBehavior.start,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (addedSports != null)
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    child: Stack(children: [
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.0, vertical: 10.0),
                                          child: Text(
                                            addedSports!,
                                            style: TextStyle(fontSize: 16.0),
                                          )),
                                      AnimatedPositioned(
                                        duration: kThemeAnimationDuration,
                                        top: -3.0,
                                        right: -3.0,
                                        child: _selectedSportsDeleteButton(
                                            addedSports),
                                      ),
                                    ]),
                                  ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            kDivider,
            //여기서부터 Tags
            Container(
              height: 90,
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: 21, top: 13, right: 0, bottom: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Hashtags',
                          style: kUploadScreenCategoryTextStyle,
                        ),
                        SizedBox(width: 18),
                        Text(
                          'Categorize your post with hashtags.',
                          style: kUploadScreenCategoryDetailTextStyle.copyWith(
                              color: kGreyColor1_767676),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 5,
                      left: 12,
                    ),
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () async {
                            myFocusNode?.unfocus();
                            final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PostTagsAddScreen(
                                      addedTagsList: addedTagsList),
                                ));
                            setState(() {
                              if (result != null) {
                                addedTagsList = result;
                              }
                            });
                          },
                          child: Text(
                            '+ Add',
                            style: kUploadScreenAddButtonTextStyle.copyWith(
                                color: kGreyColor1_767676),
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            dragStartBehavior: DragStartBehavior.start,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (addedTagsList.length != 0)
                                  for (String tag in addedTagsList)
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5.0),
                                      child: Stack(children: [
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                                vertical: 10.0),
                                            child: Text(
                                              tag,
                                              style: TextStyle(fontSize: 16.0),
                                            )),
                                        AnimatedPositioned(
                                          duration: kThemeAnimationDuration,
                                          top: -3.0,
                                          right: -3.0,
                                          child: _selectedTagsDeleteButton(tag),
                                        ),
                                      ]),
                                    ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            kDivider,
            CheckboxListTile(
                title: Text('Post with question mark?'),
                value: isQuestion,
                onChanged: (value) {
                  setState(() {
                    isQuestion = value!;
                  });
                }),
          ],
        ),
      ),
    );
  }
}
