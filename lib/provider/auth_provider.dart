import 'dart:async';

import 'package:event_app/datasource/remote/response/base/api_response.dart';
import 'package:event_app/helper/api_checker.dart';
import 'package:event_app/helper/show_toast.dart';
import 'package:event_app/models/login_model.dart';
import 'package:event_app/models/registration_model.dart';
import 'package:event_app/models/common_model.dart';
import 'package:event_app/repository/auth_repo.dart';
import 'package:event_app/ui/splash_page.dart';
import 'package:event_app/utils/app_constants.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider({required this.authRepo});

  final AuthRepo authRepo;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  changeLoaderState(bool newState) {
    _isLoading = newState;
    notifyListeners();
  }

  bool _otpSent = false;
  bool get otpSent => _otpSent;

  Timer? _otpResendTimer;

  int _resendOtpTimer = 0;

  int get resendOtpTimer => _resendOtpTimer;

  int _resendOtpCount = 0;
  int get resendOtpCount => _resendOtpCount;

  void startResendOtpTimer() {
    _otpSent = true;

    _resendOtpTimer = 30;

    _otpResendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_resendOtpTimer > 0) {
        _resendOtpTimer -= 1;

        notifyListeners();
      } else {
        _resendOtpCount += 1;
        _otpSent = false;
        timer.cancel();
      }
    });
    notifyListeners();
  }

  CommonModel? _commonModel;

  Future<CommonModel?> fetchConnectionId(BuildContext context) async {
    var data = {
      "app_key": AppConstants.apiKey,
    };
    debugPrint("request  $data");
    try {
      ApiResponse apiResponse = await authRepo.fetchConnectionId(data);
      if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
        _commonModel = CommonModel.fromJson(apiResponse.response!.data);
        saveConnectionId(_commonModel!.connectionId!);
        debugPrint('response ${apiResponse.response!.data}');
        changeLoaderState(false);
      } else {
        ApiChecker.checkApi(context, apiResponse);
        changeLoaderState(false);
      }
    } catch (error) {
      // changeLoaderState(false);
      debugPrint(error.toString());

      showErrorSnackBar(context, error.toString());
    }

    return _commonModel;
  }

  Future<CommonModel?> signupOtpRequest(BuildContext context, mobileNumber) async {
    changeLoaderState(true);

    var data = {
      "connection_id": getConnectionId(),
      "email": mobileNumber
    };
    debugPrint("request  $data");
    // try {
    ApiResponse apiResponse = await authRepo.signupOtpRequest(data);
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      _commonModel = CommonModel.fromJson(apiResponse.response!.data);

      debugPrint('response ${apiResponse.response!.data}');
      if (_commonModel?.status == AppConstants.success) {
        startResendOtpTimer();
      }
      changeLoaderState(false);
    } else {
      ApiChecker.checkApi(context, apiResponse);

      changeLoaderState(false);
    }
    // } catch (error) {
    //   changeLoaderState(false);
    //   debugPrint(error.toString());

    //   showErrorSnackBar(context, error.toString());
    // }

    return _commonModel;
  }

  Future<CommonModel?> loginOtpRequest(BuildContext context, mobileNumber) async {
    _commonModel = null;

    changeLoaderState(true);
    var data = {
      "connection_id": getConnectionId(),
      "phone": mobileNumber
    };
    debugPrint("request  $data");
    try {
      ApiResponse apiResponse = await authRepo.loginOtpRequest(data);
      debugPrint('response ${apiResponse.response?.data}');

      if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
        _commonModel = CommonModel.fromJson(apiResponse.response!.data);

        if (_commonModel?.status == AppConstants.success) {
          startResendOtpTimer();
        }
        changeLoaderState(false);
      } else {
        ApiChecker.checkApi(context, apiResponse);

        changeLoaderState(false);
      }
    } catch (error) {
      changeLoaderState(false);
      debugPrint(error.toString());

      showErrorSnackBar(context, error.toString());
    }

    return _commonModel;
  }

  RegistrationModel? _registrationModel;
  RegistrationModel? get registrationModel => _registrationModel;
  Future<RegistrationModel?> registerUser(BuildContext context, mobileNumber, fullname, email, password, countryCode) async {
    changeLoaderState(true);

    var data = {
      "connection_id": getConnectionId(),
      "name": fullname,
      "email": email,
      "phone": mobileNumber,
      "password": password,
      "country_code": countryCode,
    };
    debugPrint("request  $data");
    try {
      ApiResponse apiResponse = await authRepo.register(data);

      debugPrint('response ==>>> ${apiResponse.response?.data}');
      if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
        _registrationModel = RegistrationModel.fromJson(apiResponse.response!.data);
        saveAuthCode(_registrationModel!.authCode);

        debugPrint(_registrationModel?.toJson().toString());

        changeLoaderState(false);
      } else {
        ApiChecker.checkApi(context, apiResponse);

        changeLoaderState(false);
      }
    } catch (error) {
      changeLoaderState(false);
      debugPrint(error.toString());

      showErrorSnackBar(context, error.toString());
    }

    return _registrationModel;
  }

  LoginModel? _loginModel;
  Future<LoginModel?> login(BuildContext context, email, password) async {
    changeLoaderState(true);

    _registrationModel = null;
    var data = {
      "connection_id": getConnectionId(),
      "email": email,
      "password": password,
    };
    debugPrint("request  $data");
    try {
      ApiResponse apiResponse = await authRepo.login(data);

      debugPrint('response===>> ${apiResponse.response?.data}');
      if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
        _loginModel = LoginModel.fromJson(apiResponse.response!.data);
        saveAuthCode(_loginModel?.user?.authCode);

        changeLoaderState(false);
      } else {
        ApiChecker.checkApi(context, apiResponse);

        changeLoaderState(false);
      }
    } catch (error) {
      changeLoaderState(false);
      debugPrint(error.toString());

      showErrorSnackBar(context, error.toString());
    }

    return _loginModel;
  }

  Future<CommonModel?> requestotp(BuildContext context, email) async {
    _isLoading = true;

    _commonModel = null;
    var data = {
      "connection_id": getConnectionId(),
      "email": email,
    };
    debugPrint("request  $data");
    try {
      ApiResponse apiResponse = await authRepo.signupOtpRequest(data);

      debugPrint('response===>> ${apiResponse.response?.data}');
      if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
        _commonModel = CommonModel.fromJson(apiResponse.response!.data);

        changeLoaderState(false);
      } else {
        ApiChecker.checkApi(context, apiResponse);

        changeLoaderState(false);
      }
    } catch (error) {
      changeLoaderState(false);
      debugPrint(error.toString());

      showErrorSnackBar(context, error.toString());
    }

    return _commonModel;
  }

  Future<CommonModel?> verifyOtp(BuildContext context, phone, otp) async {
    _isLoading = true;

    _commonModel = null;
    var data = {
      "connection_id": getConnectionId(),
      "phone": phone,
      "otp": otp,
    };
    debugPrint("request  $data");
    try {
      ApiResponse apiResponse = await authRepo.signupOtpVerify(data);

      debugPrint('response===>> ${apiResponse.response?.data}');
      if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
        _commonModel = CommonModel.fromJson(apiResponse.response!.data);

        saveAuthCode(_commonModel?.authCode);

        changeLoaderState(false);
      } else {
        ApiChecker.checkApi(context, apiResponse);

        changeLoaderState(false);
      }
    } catch (error) {
      changeLoaderState(false);
      debugPrint(error.toString());

      showErrorSnackBar(context, error.toString());
    }

    return _commonModel;
  }

  Future<CommonModel?> forgotPassword(BuildContext context, email, pass, confirmPass) async {
    _isLoading = true;

    _commonModel = null;
    var data = {
      "connection_id": getConnectionId(),
      "email": email,
      "new_password": pass,
      "confirm_password": confirmPass
    };
    debugPrint("request  $data");
    try {
      ApiResponse apiResponse = await authRepo.forgotPassword(data);

      debugPrint('response===>> ${apiResponse.response?.data}');
      if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
        _commonModel = CommonModel.fromJson(apiResponse.response!.data);

        changeLoaderState(false);
      } else {
        ApiChecker.checkApi(context, apiResponse);

        changeLoaderState(false);
      }
    } catch (error) {
      changeLoaderState(false);
      debugPrint(error.toString());

      showErrorSnackBar(context, error.toString());
    }

    return _commonModel;
  }

  //Shared Preferences

  saveAuthCode(authCOde) {
    authRepo.saveAuthCode(authCOde.toString());
  }

  String? getAuthCode() {
    return authRepo.getAuthCode();
  }

  saveConnectionId(connectionId) {
    authRepo.saveConnectionId(connectionId.toString());
  }

  String? getConnectionId() {
    // return '17174190289983';
    return authRepo.getConnectionId();
  }

  logOut(BuildContext context) {
    _otpSent = false;

    authRepo.logOut();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const Splashpage(),
        ),
        (route) => false);
  }

  int _authScreenIndex = 0;
  int get authScreenIndex => _authScreenIndex;

  changeAuthScreenIndex() {
    if (_authScreenIndex == 0) {
      _authScreenIndex = 1;
    } else {
      _authScreenIndex = 0;
    }

    _passwordVisible = false;
    notifyListeners();
  }

  bool _passwordVisible = false;
  bool get passwordVisible => _passwordVisible;

  changePasswordVisbility() {
    _passwordVisible = !passwordVisible;
    notifyListeners();
  }
}
