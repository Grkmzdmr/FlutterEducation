import 'package:first_application/domain/model/authentication.dart';
import 'package:first_application/data/network/request.dart';
import 'package:first_application/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:first_application/domain/repository/repository.dart';

class RepositoryImpl extends Repository{
  
  
  
  
  
  
  @override
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest) {
    // TODO: implement login
    throw UnimplementedError();
  }
  





}