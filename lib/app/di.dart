import 'package:first_application/app/app_prefs.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.asNewInstance();

Future<void> initAppModule() async {
  //SHARED PREFS
  final sharedPref = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPref);

  //APP PREFS
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));




      
}
