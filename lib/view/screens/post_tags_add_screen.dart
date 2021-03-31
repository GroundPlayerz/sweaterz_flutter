import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sweaterz_flutter/view/constants/constants.dart';
import 'package:sweaterz_flutter/view/constants/text_styles.dart';

class PostTagsAddScreen extends StatefulWidget {
  final List<String> addedTagsList;

  PostTagsAddScreen({this.addedTagsList});

  @override
  _PostTagsAddScreenState createState() => _PostTagsAddScreenState();
}

class _PostTagsAddScreenState extends State<PostTagsAddScreen> {
  List<String> _addedTagsList = [];
  FocusNode myFocusNode;

  final TextEditingController tagAddController = TextEditingController();
  //ThemeData get currentTheme => context.themeData;
  bool _isButtonEnabled = false;

  Widget _selectedTagsDeleteButton(tag) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _addedTagsList.remove(tag);
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
    _addedTagsList.addAll(widget.addedTagsList);
    myFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    myFocusNode.unfocus();
    tagAddController.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundWhiteColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: kBackgroundWhiteColor,
        iconTheme: IconThemeData(
          color: kIconGreyColor1_B2B2B2, //change your color here
        ),
        actions: [
          TextButton(
              onPressed: () {
                myFocusNode.unfocus();
                Navigator.pop(context, _addedTagsList);
              },
              child: Text('Done'))
        ],
      ),
      body: GestureDetector(
        onTap: () {
          myFocusNode.unfocus();
        },
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Wrap(
                alignment: WrapAlignment.start,
                children: [
                  Text(
                    "Tip!",
                    style: TextStyle(
                        fontFamily: 'Open_Sans',
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: kSweaterzColor),
                  ),
                  Text(
                    "Enter the skill's name, skill difficulty, exercise location, and more."
                    " If you use tags well, you can keep your posts organized! "
                    "The tag you entered will be used to search for posts and sort posts in your profile.",
                    style:
                        kAuxiliaryTextStyle.copyWith(color: kGreyColor1_767676),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kTextFieldRappingBoxColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 13.0,
                    right: 13.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 5,
                        child: TextField(
                          autofocus: true,
                          focusNode: myFocusNode,
                          style: kBodyTextStyle1M,
                          cursorColor: kSweaterzColor,
                          keyboardType: TextInputType.text,
                          textAlign: TextAlign.start,
                          controller: tagAddController,
                          decoration: kTextFieldDecoration.copyWith(
                            hintText: '#Write any tags   ex) #dribble',
                            hintStyle: kTextFieldHintTextStyle.copyWith(
                                color: kGreyColor2_999999),
                          ),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(20),
                            FilteringTextInputFormatter.deny(' '),
                          ],
                          onChanged: (String value) {
                            if (value != '') {
                              setState(() {
                                _isButtonEnabled = true;
                              });
                            } else {
                              setState(() {
                                _isButtonEnabled = false;
                              });
                            }
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: addButton(
                            textContent: 'Add',
                            isButtonEnabled: _isButtonEnabled,
                            onPressed: () {
                              setState(() {
                                _addedTagsList.add(tagAddController.text);
                                tagAddController.clear();
                                _isButtonEnabled = false;
                              });
                            }),
                      ),

                      //TextButton(onPressed: (){_addedTagsList.add(tagAddController.text);}, child: Text('Add'))
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  dragStartBehavior: DragStartBehavior.start,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 20.0,
                      ),
                      if (_addedTagsList != null)
                        if (_addedTagsList.length != 0)
                          for (String tag in _addedTagsList)
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                              child: Stack(children: [
                                Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 10.0),
                                    child: Text(
                                      '# $tag',
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
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget addButton(
      {String textContent, bool isButtonEnabled = true, Function onPressed}) {
    return TextButton(
      style: TextButton.styleFrom(
        //primary: Colors.red,
        //visualDensity: ,
        //backgroundColor: kSweaterzColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
      ), //styleFrom
      onPressed: isButtonEnabled ? onPressed : null,
      child: Center(
        child: Text(textContent,
            style: TextStyle(
                fontFamily: 'Open_Sans',
                fontSize: 15,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.3,
                color: isButtonEnabled
                    ? Colors.black
                    : Colors.black.withOpacity(0.4))),
      ),
    );
  }
}
