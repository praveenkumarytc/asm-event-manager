import 'package:event_app/datasource/remote/dio/dio_client.dart';
import 'package:event_app/datasource/remote/exception/api_error_handler.dart';
import 'package:event_app/datasource/remote/response/base/api_response.dart';
import 'package:event_app/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  AuthRepo({this.dioClient, this.sharedPreferences});

  final DioClient? dioClient;
  final SharedPreferences? sharedPreferences;

  Future<ApiResponse> fetchConnectionId(data) async {
    try {
      final response = await dioClient!.post(AppConstants.getConnectionId, data: data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> loginOtpRequest(data) async {
    try {
      final response = await dioClient!.post(AppConstants.loginOtpRequest, data: data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> login(data) async {
    try {
      final response = await dioClient!.post(AppConstants.login, data: data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> signupOtpRequest(data) async {
    try {
      final response = await dioClient!.post(AppConstants.signupOtpRequest, data: data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> signupOtpVerify(data) async {
    try {
      final response = await dioClient!.post(AppConstants.signupOtpVerify, data: data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> forgotPassword(data) async {
    try {
      final response = await dioClient!.post(AppConstants.new_password, data: data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> register(data) async {
    try {
      final response = await dioClient!.post(AppConstants.registerUser, data: data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  saveAuthCode(String authCode) {
    sharedPreferences!.setString(AppConstants.authCode, authCode);
  }

  String? getAuthCode() {
    return sharedPreferences!.getString(AppConstants.authCode);
  }

  saveConnectionId(String connectionId) {
    sharedPreferences!.setString(AppConstants.connectionId, connectionId);
  }

  String? getConnectionId() {
    return sharedPreferences!.getString(AppConstants.connectionId);
  }

  logOut() {
    sharedPreferences!.clear();
  }
}
