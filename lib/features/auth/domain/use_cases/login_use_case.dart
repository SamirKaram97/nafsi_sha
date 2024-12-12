import 'package:dartz/dartz.dart';
import 'package:gp_nafsi/core/errors/failure.dart';
import 'package:gp_nafsi/core/use_case/use_case.dart';
import 'package:gp_nafsi/features/auth/data/models/user_data_model.dart';
import 'package:gp_nafsi/features/auth/domain/params/login_params.dart';
import 'package:gp_nafsi/features/auth/domain/repo/auth_repo.dart';

class LoginUseCase extends UseCase<UserDataModel,LoginParams>{
  final AuthRepo authRepo;

  LoginUseCase(this.authRepo);
  @override
  Future<Either<Failure, UserDataModel>> call([LoginParams? param]) {
    return authRepo.login(param!.email, param.password);
  }
}
