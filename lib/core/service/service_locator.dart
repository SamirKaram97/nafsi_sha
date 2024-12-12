import 'package:get_it/get_it.dart';
final GetIt sl = GetIt.instance;

class ServicesLocator {
  void init() {
      setupAuthServices();
  }

  void setupAuthServices() {
      /// Data Sources
      // sl.registerLazySingleton(() => SignUpData());


      /// Repositories
      // sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(
      //       sl<SignUpData>(),
      //       sl<LoginData>(),
      //       sl<FillProfileData>(),
      //       sl<ForgetPasswordData>(),
      //       sl<PhoneLoginData>(),
      //     ));

      /// USE CASES

      /// Blocs

      // sl.registerFactory(() => SignUpBloc(sl<AuthRepo>()));


  }

}
