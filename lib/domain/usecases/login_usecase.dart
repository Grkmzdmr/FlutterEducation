import 'package:first_application/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:first_application/data/network/request.dart';
import 'package:first_application/domain/model/authentication.dart';
import 'package:first_application/domain/repository/repository.dart';
import 'package:first_application/domain/usecases/base_usecase.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication> {
  Repository _repository;
  LoginUseCase(this._repository);




  @override
  Future<Either<Failure, Authentication>> execute(LoginUseCaseInput input) {
    return _repository.login(LoginRequest(input.password, input.sign,input.deviceId));
  }
}




class LoginUseCaseInput {
  String sign;
  String password;
  String deviceId;

  LoginUseCaseInput(this.sign, this.password,this.deviceId);
}
