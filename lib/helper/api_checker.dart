import 'package:event_app/datasource/remote/response/base/api_response.dart';
import 'package:event_app/helper/show_toast.dart';
import 'package:flutter/material.dart';

class ApiChecker {
  static void checkApi(BuildContext context, ApiResponse apiResponse) {
    if (apiResponse.error != null) {
      if (apiResponse.error is String && apiResponse.error.toString() == 'Unauthorized.') {
        //Provider.of<HomeProvider>(context,listen: false).clearHomeAddress();
        //Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => AuthScreen()), (route) => false);
      } else {
        String errorMessage;
        if (apiResponse.error is String) {
          errorMessage = apiResponse.error.toString();
        } else {
          errorMessage = apiResponse.error.errors[0].message;
        }

        debugPrint(errorMessage);
        showErrorSnackBar(context, errorMessage);
      }
    }
  }
}
