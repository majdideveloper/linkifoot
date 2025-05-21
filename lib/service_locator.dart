import 'package:get_it/get_it.dart';
import 'package:linkifoot/core/network/network_info.dart';
import 'package:linkifoot/core/secrets/app_secrets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl.call()));

  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );

  sl.registerLazySingleton(() => supabase.client);

  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPreferences);

  // sl.registerLazySingleton(() => InternetConnection());
}
