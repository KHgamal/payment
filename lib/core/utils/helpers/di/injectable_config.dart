/*import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:qanony/core/utils/helpers/di/injectable_config.config.dart';

import '../../../../features/dates/data/data_sources/api_service.dart';

GetIt getIt = GetIt.instance;

@InjectableInit()
GetIt configureDependencies() => getIt.init();

 @module
abstract class RegisterModule {
  
  @singleton
  Dio get provideDio {
    final Dio dio=Dio();
     dio.interceptors.add(LogInterceptor(requestBody: true,responseBody: true));
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers["Authorization"] = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3Fhbm9ueS5hcHAvYXBpL3YzL3VzZXIvbG9naW4iLCJpYXQiOjE3MjM2MzUxNjcsImV4cCI6MjA4MzYzNTE2NywibmJmIjoxNzIzNjM1MTY3LCJqdGkiOiIxYTZHOTRQWGhXZm8yYlljIiwic3ViIjoxNDQ2LCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.r8iSP8y7iQgz_Gx4fOz-OPp1DtlocBY3SCMjLjVca04";
       options.headers['Accept']= 'application/json';
        options.headers['Content-Type']= 'application/json';
        return handler.next(options);
      },
    ));
    return dio;
  }

  @singleton
  ApiService get apiService => ApiService(provideDio); 
}
*/