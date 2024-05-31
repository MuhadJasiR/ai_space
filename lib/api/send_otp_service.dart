import 'dart:convert';
import 'dart:developer';

import 'package:ai_space/controller/auth_controller.dart';
import 'package:ai_space/core/constants/api_const.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SendCustomerOTPService {
  final url = APiConfig.baseUrl + APiConfig.sendOTP;
  final authController = Get.find<AuthController>();
  Future sendOtpRequest() async {
    final response = await http.post(Uri.parse(url),
        body: json.encode({
          "email": authController.companyEmailController.text,
          "isForRegistration": true
        }));
    if (response.statusCode == 200) {
      log(response.body, name: "send otp response");
    } else {
      Exception("Error while send OTP");
    }
  }
}
