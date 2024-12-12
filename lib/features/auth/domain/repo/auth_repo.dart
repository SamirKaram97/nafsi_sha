import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:gp_nafsi/core/errors/failure.dart';
import 'package:gp_nafsi/features/auth/data/models/user_data_model.dart';

abstract class AuthRepo{
  Future<Either<Failure,UserDataModel>> login(String email,String password);
  Future<Either<Failure,void>> register(String email,String password);
  Future<Either<Failure,UserDataModel>> loginGoogle();
  Future<Either<Failure,void>> registerGoogle();
  Future<Either<Failure,UserDataModel>> loginFacebook();
  Future<Either<Failure,void>> registerFacebook();
  Future<Either<Failure,UserDataModel>> loginFaceId(String faceId);
}