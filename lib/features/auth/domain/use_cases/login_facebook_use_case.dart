import 'package:dartz/dartz.dart';
import 'package:gp_nafsi/core/errors/failure.dart';
import 'package:gp_nafsi/core/use_case/use_case.dart';
import 'package:gp_nafsi/features/auth/data/models/user_data_model.dart';
import 'package:gp_nafsi/features/auth/domain/params/login_params.dart';
import 'package:gp_nafsi/features/auth/domain/repo/auth_repo.dart';

class LoginFacebookUseCase extends UseCase<UserDataModel,NoParam>{
  final AuthRepo authRepo;

  LoginFacebookUseCase(this.authRepo);
  @override
  Future<Either<Failure, UserDataModel>> call([NoParam? param]) {
    return authRepo.loginFacebook();
  }
}