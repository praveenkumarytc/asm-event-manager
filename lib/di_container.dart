import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:event_app/datasource/remote/dio/dio_client.dart';
import 'package:event_app/datasource/remote/dio/logging_interceptor.dart';
import 'package:event_app/helper/network_info.dart';

import 'package:event_app/provider/auth_provider.dart';

import 'package:event_app/provider/home_provider.dart';

import 'package:event_app/repository/home_repo.dart';
import 'package:event_app/repository/auth_repo.dart';

import 'package:event_app/utils/app_constants.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => NetworkInfo(sl()));
  sl.registerFactory(() => DioClient(AppConstants.BASE_URL, sl(), loggingInterceptor: sl(), sharedPreferences: sl()));

//Repository

  sl.registerLazySingleton(() => AuthRepo(sharedPreferences: sl(), dioClient: sl()));
  sl.registerLazySingleton(() => HomeRepo(sharedPreferences: sl(), dioClient: sl()));
  // sl.registerLazySingleton(() => OrderRepo(dioClient: sl()));

//Providers

  // sl.registerFactory(() => OfflineProvider(notificationProvider: sl(), offlineRepo: sl()));
  // sl.registerFactory(() => NotificationProvider());
  // sl.registerFactory(() => HomeProvider(homeRepo: sl()));

  sl.registerFactory(() => HomeProvider(homeRepo: sl()));
  sl.registerFactory(() => AuthProvider(authRepo: sl()));

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerFactory(() => sharedPreferences);
  sl.registerFactory(() => Dio());
  sl.registerFactory(() => LoggingInterceptor());
  sl.registerFactory(() => Connectivity());
}
