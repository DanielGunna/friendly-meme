import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';
import 'package:teste_boticario/controllers/create_post_controller.dart';
import 'package:teste_boticario/controllers/feed_controller.dart';
import 'package:teste_boticario/controllers/login_controller.dart';
import 'package:teste_boticario/controllers/sign_up_controller.dart';
import 'package:teste_boticario/data/database/database.dart';
import 'package:teste_boticario/data/datasources/local/post_local_data_source.dart';
import 'package:teste_boticario/data/datasources/local/user_local_data_source.dart';
import 'package:teste_boticario/data/datasources/remote/post_remote_data_source.dart';
import 'package:teste_boticario/data/repositories/posts_repository.dart';
import 'package:teste_boticario/data/repositories/user_repository.dart';
import 'package:teste_boticario/stores/post_store.dart';
import 'package:teste_boticario/stores/user_store.dart';
import 'package:teste_boticario/utils/network_info.dart';
import 'package:teste_boticario/views/viewmodels/login_viewmodel.dart';
import 'package:teste_boticario/views/viewmodels/sign_up_viewmodel.dart';

final injectionInstance = GetIt.instance;

Future<void> setupInjection() async {
  provideViewModels();
  provideControllers();
  provideStores();
  provideRepositories();
  provideDataSources();
  provideGeneral();
}

T inject<T>() {
  return injectionInstance.get<T>();
}

// View Models
void provideViewModels() {
  injectionInstance.registerFactory(() => LoginViewModel());
  injectionInstance.registerFactory(() => SignUpViewModel());
}

// Controllers
void provideControllers() {
  injectionInstance
      .registerFactory(() => LoginController(store: injectionInstance()));

  injectionInstance
      .registerFactory(() => SignUpController(store: injectionInstance()));

  injectionInstance.registerFactory(
      () => CreatePostController(postStore: injectionInstance()));

  injectionInstance
      .registerFactory(() => FeedController(postStore: injectionInstance()));
}

// Stores
void provideStores() {
  injectionInstance.registerLazySingleton<UserStore>(
    () => UserStore(injectionInstance()),
  );
  injectionInstance.registerLazySingleton<PostStore>(
    () => PostStore(injectionInstance()),
  );
}

// Repositories
void provideRepositories() {
  injectionInstance.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(
      remoteDataSource: injectionInstance(),
      localDataSource: injectionInstance(),
      networkInfo: injectionInstance(),
    ),
  );
  injectionInstance.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      localDataSource: injectionInstance(),
      networkInfo: injectionInstance(),
    ),
  );
}

// Data sources
void provideDataSources() {
  injectionInstance.registerLazySingleton<PostRemoteDataSource>(
    () => PostRemoteDataSourceImpl(
      client: injectionInstance(),
    ),
  );

  injectionInstance.registerLazySingleton<PostLocalDataSource>(
    () => PostLocalSourceImpl(),
  );

  injectionInstance.registerLazySingleton<UserLocalDataSource>(
    () => UserLocalSourceImpl(database: injectionInstance()),
  );
}

void provideGeneral() {
  //! Utils
  injectionInstance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(dataConnectionChecker: injectionInstance()));
  //! External
  injectionInstance.registerLazySingleton(() => DataConnectionChecker());
  injectionInstance.registerLazySingleton(() => http.Client);
  injectionInstance
      .registerSingletonAsync<Database>(() async => openDatabaseConnection());
}
