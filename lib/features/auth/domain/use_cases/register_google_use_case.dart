import 'package:dartz/dartz.dart';
import 'package:gp_nafsi/core/errors/failure.dart';
import 'package:gp_nafsi/core/use_case/use_case.dart';
import 'package:gp_nafsi/features/auth/data/models/user_data_model.dart';
import 'package:gp_nafsi/features/auth/domain/params/login_params.dart';
import 'package:gp_nafsi/features/auth/domain/repo/auth_repo.dart';

class RegisterGoogleUseCase extends UseCase<void,void>{
  final AuthRepo authRepo;

  RegisterGoogleUseCase(this.authRepo);

  @override
  Future<Either<Failure, void>> call([void param]) {
    return authRepo.registerGoogle();
  }
}