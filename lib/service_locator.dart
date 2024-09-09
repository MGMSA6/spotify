import 'package:get_it/get_it.dart';
import 'package:spotify/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify/data/sources/auth_forebase_service.dart';
import 'package:spotify/domain/repository/auth.dart';
import 'package:spotify/domain/usecases/auth/register_usecase.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthForebaseService>(AuthForebaseServiceImpl());

  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  sl.registerSingleton<RegisterUsecase>(RegisterUsecase());
}
