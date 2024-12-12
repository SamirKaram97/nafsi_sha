import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gp_nafsi/core/database/api/api_service.dart';
import 'package:gp_nafsi/core/errors/failure.dart';
import 'package:gp_nafsi/core/errors/server_failure.dart';
import 'package:gp_nafsi/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:gp_nafsi/features/auth/data/models/user_data_model.dart';
import 'package:gp_nafsi/features/auth/domain/repo/auth_repo.dart';
import 'package:gp_nafsi/shared/network/remote/firebase_services.dart';

class AuthRepoImpl extends AuthRepo{
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, UserDataModel>> login(String email, String password)async {
    try{
      var userModel = await authRemoteDataSource.login(email, password);
      return Right(userModel);
    }
    on NegativeValueException catch(e){
      return Left(ServerFailure(errMessage: e.message));
    }
    catch (e){
      if(e is DioException){
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserDataModel>> loginFacebook()async {
    try{
      var userModel = await authRemoteDataSource.loginFacebook();
      return Right(userModel);
    }
    on NegativeValueException catch(e){
      return Left(ServerFailure(errMessage: e.message));
    }
    on DioException catch (e)
    {
      return Left(ServerFailure.fromDioException(e));
    }
    on FirebaseAuthException catch (e) {
      return Left(ServerFailure(errMessage:FirebaseServices.getRegisterMessageFromErrorCode(e.code)));
    }
    catch (e){
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }



  @override
  Future<Either<Failure, UserDataModel>> loginGoogle()async {
    try{
      var userModel = await authRemoteDataSource.loginGoogle();
      return Right(userModel);
    }
    on NegativeValueException catch(e){
      return Left(ServerFailure(errMessage: e.message));
    }
    on DioException catch (e)
    {
      return Left(ServerFailure.fromDioException(e));
    }
    on FirebaseAuthException catch (e) {
      return Left(ServerFailure(errMessage:FirebaseServices.getRegisterMessageFromErrorCode(e.code)));
    }
    catch (e){
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> register(String email, String password) async {
    try{
       await authRemoteDataSource.register(email, password);
      return Right(null);
    }
    on NegativeValueException catch(e){
      return Left(ServerFailure(errMessage: e.message));
    }
    catch (e){
      if(e is DioException){
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> registerFacebook() async {
    try{
       await authRemoteDataSource.registerFacebook();
      return Right(null);
    }
    on NegativeValueException catch(e){
      return Left(ServerFailure(errMessage: e.message));
    }
    on DioException catch (e)
    {
      return Left(ServerFailure.fromDioException(e));
    }
    on FirebaseAuthException catch (e) {
      return Left(ServerFailure(errMessage:FirebaseServices.getRegisterMessageFromErrorCode(e.code)));
    }
    catch (e){
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> registerGoogle() async {

    try{
      await authRemoteDataSource.registerGoogle();
      return Right(null);
    }
    on NegativeValueException catch(e){
      return Left(ServerFailure(errMessage: e.message));
    }
    on DioException catch (e)
    {
      return Left(ServerFailure.fromDioException(e));
    }
    on FirebaseAuthException catch (e) {
      return Left(ServerFailure(errMessage:FirebaseServices.getRegisterMessageFromErrorCode(e.code)));
    }
    catch (e){
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserDataModel>> loginFaceId(String faceId) async {
    try{
      var userModel = await authRemoteDataSource.loginFaceId(faceId);
      return Right(userModel);
    }
    on NegativeValueException catch(e){
      return Left(ServerFailure(errMessage: e.message));
    }
    catch (e){
      if(e is DioException){
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
  }

