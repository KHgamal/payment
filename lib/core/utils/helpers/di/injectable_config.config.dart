// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:payment/core/network_info.dart' as _i99;
import 'package:payment/core/utils/helpers/di/injectable_config.dart' as _i711;
import 'package:payment/features/payment/data/data_source/remote_datasource.dart'
    as _i695;
import 'package:payment/features/payment/data/repositories/payment_repo_impl.dart'
    as _i7;
import 'package:payment/features/payment/data/services/payment_service.dart'
    as _i1037;
import 'package:payment/features/payment/domain/payment_repo.dart' as _i944;
import 'package:payment/features/payment/domain/payment_usecase.dart' as _i748;
import 'package:payment/features/payment/presentation/controller/payment/payment_bloc.dart'
    as _i966;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i361.Dio>(() => registerModule.provideDio);
    gh.singleton<_i1037.ApiClient>(() => registerModule.apiService);
    gh.singleton<_i695.PaymentRemoteDataSource>(
        () => registerModule.paymentRemoteDataSource);
    gh.singleton<_i99.NetworkInfo>(() => registerModule.networkInfo);
    gh.factory<_i944.PaymentRepository>(() => _i7.PaymentRepositoryImpl(
          remoteDataSource: gh<_i695.PaymentRemoteDataSource>(),
          networkInfo: gh<_i99.NetworkInfo>(),
          sharedPreferences: gh<_i460.SharedPreferences>(),
        ));
    gh.factory<_i748.ProcessPaymentUseCase>(
        () => _i748.ProcessPaymentUseCase(gh<_i944.PaymentRepository>()));
    gh.factory<_i966.PaymentBloc>(() => _i966.PaymentBloc(
        processPaymentUseCase: gh<_i748.ProcessPaymentUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i711.RegisterModule {}
