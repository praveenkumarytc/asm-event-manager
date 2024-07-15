import 'package:event_app/datasource/remote/dio/dio_client.dart';
import 'package:event_app/datasource/remote/exception/api_error_handler.dart';
import 'package:event_app/datasource/remote/response/base/api_response.dart';
import 'package:event_app/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeRepo {
  HomeRepo({this.dioClient, this.sharedPreferences});

  final DioClient? dioClient;
  final SharedPreferences? sharedPreferences;

  Future<ApiResponse> boothListing(data) async {
    try {
      final response = await dioClient!.post(AppConstants.booth_listing, data: data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> updatebooth(data) async {
    try {
      final response = await dioClient!.post(AppConstants.booth_geotaging, data: data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> scanTicket(data) async {
    try {
      final response = await dioClient!.post(AppConstants.scan_ticket, data: data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> checkedInCustomers(data) async {
    try {
      final response = await dioClient!.post(AppConstants.checkedin_customers, data: data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
