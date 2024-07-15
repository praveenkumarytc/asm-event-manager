import 'package:event_app/datasource/remote/response/base/api_response.dart';
import 'package:event_app/helper/api_checker.dart';
import 'package:event_app/helper/show_toast.dart';
import 'package:event_app/models/all_booth_list_model.dart';
import 'package:event_app/models/check_in_response_model.dart';
import 'package:event_app/models/checked_in_customer_model.dart';
import 'package:event_app/models/common_model.dart';
import 'package:event_app/provider/auth_provider.dart';
import 'package:event_app/repository/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeProvider extends ChangeNotifier {
  final HomeRepo homeRepo;
  HomeProvider({required this.homeRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  changeLoaderState(bool newState) {
    _isLoading = newState;
    notifyListeners();
  }

  AllBoothListModel? _allBoothListModel;
  AllBoothListModel? get allBoothListModel => _allBoothListModel;
  Future<AllBoothListModel?> getAllBooths(BuildContext context) async {
    _isLoading = true;

    _allBoothListModel = null;
    var data = {
      "connection_id": Provider.of<AuthProvider>(context, listen: false).getConnectionId(),
      "auth_code": Provider.of<AuthProvider>(context, listen: false).getAuthCode(),
    };

    debugPrint("request  $data");
    try {
      ApiResponse apiResponse = await homeRepo.boothListing(data);

      debugPrint('response===>> ${apiResponse.response?.data}');
      if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
        _allBoothListModel = AllBoothListModel.fromJson(apiResponse.response!.data);

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

    return _allBoothListModel;
  }

  CommonModel? _commonModel;
  CommonModel? get commonModel => _commonModel;

  Future<CommonModel?> upadateBoothLatLng(BuildContext context, lat, lng, boothId) async {
    _isLoading = true;

    var data = {
      "connection_id": Provider.of<AuthProvider>(context, listen: false).getConnectionId(),
      "auth_code": Provider.of<AuthProvider>(context, listen: false).getAuthCode(),
      "latitude": lat,
      "longitude": lng,
      "booth_id": boothId
    };

    debugPrint("request  $data");
    try {
      ApiResponse apiResponse = await homeRepo.updatebooth(data);

      debugPrint('response===>> ${apiResponse.response?.data}');
      if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
        _commonModel = CommonModel.fromJson(apiResponse.response!.data);
        getAllBooths(context);
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

  ScanResponseModel? _scanResponseModel;
  Future<ScanResponseModel?> scanQr(BuildContext context, qrText) async {
    _isLoading = true;

    var data = {
      "connection_id": Provider.of<AuthProvider>(context, listen: false).getConnectionId(),
      "auth_code": Provider.of<AuthProvider>(context, listen: false).getAuthCode(),
      "booking_id": qrText,
    };

    debugPrint("request  $data");
    try {
      ApiResponse apiResponse = await homeRepo.scanTicket(data);

      debugPrint('response===>> ${apiResponse.response?.data}');
      if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
        _scanResponseModel = ScanResponseModel.fromJson(apiResponse.response!.data);
        getAllBooths(context);
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

    return _scanResponseModel;
  }

  CheckedInCustomersModel? _checkedInCustomersModel;
  CheckedInCustomersModel? get checkedInCustomersModel => _checkedInCustomersModel;
  Future<CheckedInCustomersModel?> getCheckedInCustomers(BuildContext context, dynamic eventId) async {
    _isLoading = true;

    var data = {
      "connection_id": Provider.of<AuthProvider>(context, listen: false).getConnectionId(),
      "auth_code": Provider.of<AuthProvider>(context, listen: false).getAuthCode(),
      "event_id": eventId,
    };

    debugPrint("request  $data");
    try {
      ApiResponse apiResponse = await homeRepo.checkedInCustomers(data);

      debugPrint('response===>> ${apiResponse.response?.data}');
      if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
        _checkedInCustomersModel = CheckedInCustomersModel.fromJson(apiResponse.response!.data);
        getAllBooths(context);
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

    return _checkedInCustomersModel;
  }
}
