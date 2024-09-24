import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:payment/core/network_info.dart';
import 'package:payment/core/utils/helpers/di/injectable_config.config.dart';
import 'package:payment/features/payment/data/data_source/remote_datasource.dart';
import 'package:payment/features/payment/data/services/payment_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt getIt = GetIt.instance;

@InjectableInit()
Future<GetIt> configureDependencies() => getIt.init();

 @module
abstract class RegisterModule {
   @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
  
  @singleton
  Dio get provideDio {
    final Dio dio=Dio();
     dio.interceptors.add(LogInterceptor(requestBody: true,responseBody: true));
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
       options.headers['Accept']= 'application/json';
        options.headers['Content-Type']= 'application/json';
        return handler.next(options);
      },
    ));
    return dio;
  }

  @singleton
  ApiClient get apiService => ApiClient(provideDio); 

  @singleton
  PaymentRemoteDataSource get paymentRemoteDataSource =>
      PaymentRemoteDataSourceImpl(apiClient: apiService);


  @singleton
  NetworkInfo get networkInfo => NetworkInfo();
}
