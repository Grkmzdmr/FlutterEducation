import 'package:first_application/app/app_prefs.dart';
import 'package:first_application/data/data_source/remote_data_source.dart';
import 'package:first_application/data/network/app_api.dart';
import 'package:first_application/data/network/dio_factory.dart';
import 'package:first_application/data/network/repository/repository_impl.dart';
import 'package:first_application/domain/repository/repository.dart';
import 'package:first_application/domain/usecases/login_usecase.dart';
import 'package:first_application/presentation/login/login_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.asNewInstance();

Future<void> initAppModule() async {
  //SHARED PREFS
  final sharedPref = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPref);

  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImplementer(instance()));

  //APP PREFS
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  instance.registerLazySingleton<Repository>(() => RepositoryImpl(instance()));

  instance.registerLazySingleton<DioFactory>(() => DioFactory());

  final dio = await instance<DioFactory>().getDio();

  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));
}

//login
initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}
