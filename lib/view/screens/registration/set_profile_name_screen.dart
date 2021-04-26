import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sweaterz_flutter/bloc/cubit/auth_cubit.dart';
import 'package:sweaterz_flutter/bloc/state/auth_state.dart';
import 'package:sweaterz_flutter/networking_service/registration_service.dart';
import 'package:sweaterz_flutter/view/constants/constants.dart';
import 'package:sweaterz_flutter/view/screens/registration/registration_complete_screen.dart';
import '../components/rounded_color_button.dart';

class SetProfileNameScreen extends StatefulWidget {
  @override
  _SetProfileNameScreenState createState() => _SetProfileNameScreenState();
}

class _SetProfileNameScreenState extends State<SetProfileNameScreen> {
  final TextEditingController profileNameController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double convertHeightRatio = mediaQuery.size.height / kIphoneXHeight;
    // double convertWidthRatio = mediaQuery.size.width / kIphoneXWidth;

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is FlaskSignedIn) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => RegistrationCompleteScreen()),
              (route) => false);
        }
      },
      child: Scaffold(
        body: Center(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 38.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: double.infinity),
                  SizedBox(height: 90 * convertHeightRatio),
                  Text(
                    'Add profile name',
                    style: kBigTitleTextStyle,
                  ),
                  SizedBox(height: 8 * convertHeightRatio),
                  Text(
                    'Please enter your profile name.\n'
                    'This profile name will be used in our app.',
                    style: kBodyTextStyle1M.copyWith(color: kGreyColor1_767676),
                  ),
                  SizedBox(height: 90 * convertHeightRatio),
                  TextField(
                    style: kBodyTextStyle1M,
                    cursorColor: kSweaterzColor,
                    //keyboardType: TextInputType,
                    textAlign: TextAlign.start,
                    controller: profileNameController,
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter profile name'),
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
                  SizedBox(height: 18 * convertHeightRatio),
                  roundedColorButton(
                      textContent: 'Done',
                      isButtonEnabled: _isButtonEnabled,
                      onPressed: () {
                        BlocProvider.of<AuthCubit>(context).signUp(
                            profileName: profileNameController.text.trim());
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
