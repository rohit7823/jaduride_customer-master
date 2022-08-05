import 'package:get_it/get_it.dart';
import 'package:jaduride/app/locator_impl.dart';
import 'package:jaduride/app/use_cases/base_url_fetch_use_case.dart';
import 'package:jaduride/app/use_cases/fetch_recent_rides_impl.dart';
import 'package:jaduride/app/use_cases/fetch_user_id_use_case.dart';
import 'package:jaduride/app/use_cases/register_user_use_case_impl.dart';
import 'package:jaduride/app/use_cases/send_otp_use_case_impl.dart';
import 'package:jaduride/core/use_cases/fetch_user_id_use_case.dart';
import 'package:jaduride/core/use_cases/register_user_use_case.dart';
import 'package:jaduride/validator.dart';
import 'package:jaduride/validator_impl.dart';
import '../core/app_settings.dart';
import '../core/locator.dart';
import '../core/use_cases/base_url_fetch_use_case.dart';
import '../core/use_cases/fetch_recent_rides_use_case.dart';
import '../core/use_cases/send_otp_use_case.dart';
import 'app_settings_impl.dart';
import 'navigation_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/network.dart';
import 'network_impl.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();

  // shared prefs instance
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  // rest call
  instance.registerLazySingleton<Network>(() => NetworkImpl());
  instance.registerLazySingleton<NavigationService>(() => NavigationServiceImpl());
  instance.registerLazySingleton<AppSettings>(() => AppSettingsImpl(instance()));
  instance.registerLazySingleton<BaseUrlFetchUseCase>(() => BaseUrlFetchUseCaseImpl());
  instance.registerLazySingleton<SendOtpUseCase>(() => SendOtpUseCaseImpl());
  instance.registerLazySingleton<FetchUserIdUseCase>(() => FetchUserIdUseCaseImpl());
  instance.registerLazySingleton<Validator>(() => ValidatorImpl());
  instance.registerLazySingleton<RegisterUserUseCase>(() => RegisterUserUseCaseImpl());
  instance.registerLazySingleton<Locator>(() => LocatorImpl());
  instance.registerLazySingleton<FetchRecentRidesUseCase>(() => FetchRecentRidesUseCaseImpl());
}