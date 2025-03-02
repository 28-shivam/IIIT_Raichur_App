import 'dart:convert';

import 'package:jwt_decoder/jwt_decoder.dart';

import '../../../core/constants/global_variables.dart';
import '../../../core/services/api_service.dart';
import '../../models/user_model.dart';

class AuthRepository {
  Future<Map<String, dynamic>> sendLoginOTP(String mobile) async {
    try {
      final response = await ApiService.postRequest(
          "$backendUrl/api/v1/auth/customerMobileLoginOtp",
          {
            'mobile': mobile,
          }
      );
      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if(data['success']==true){
          return data;
        } else {
          throw Exception('${data['message']?? "Some Error Occurred"}');
        }
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to send otp');
    }
  }

  Future<Map<String, dynamic>> getUser(String token) async {
    try {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      String userId = decodedToken['id'];

      final response = await ApiService.getRequest(
          "$backendUrl/api/v1/auth/getCustomer/$userId",
      );
      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if(data['success']==true){
          return data;
        } else {
          throw Exception('${data['message']?? "Some Error Occurred"}');
        }
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to send otp');
    }
  }

  Future<Map<String, dynamic>> submitOTP(String mobile, int otp) async {
    try {
      final response = await ApiService.postRequest(
          "$backendUrl/api/v1/auth/customerLoginOtpVerify",
          {
            'mobile': mobile,
            'otp': otp
          }
      );
      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if(data['success']==true){
          return data;
        } else {
          throw Exception('${data['message']?? "Some Error Occurred"}');
        }
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to submit OTP');
    }
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(seconds: 1));
  }
}
