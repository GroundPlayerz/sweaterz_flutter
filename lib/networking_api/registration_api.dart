import 'package:sweaterz_flutter/networking_service/registration_service.dart';

class RegistrationAPI {
  Future<bool> isRegistered() async {
    return RegistrationService().isRegistered();
  }

  void setInitialProfileName(String profileName) async {
    RegistrationService().setInitialProfileName(profileName);
  }

  void setInitialMemberInfo() async {
    RegistrationService().setInitialMemberInfo();
  }
}
