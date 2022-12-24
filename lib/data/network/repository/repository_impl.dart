import 'package:first_application/data/data_source/remote_data_source.dart';
import 'package:first_application/data/mapper/mapper.dart';
import 'package:first_application/data/network/app_api.dart';
import 'package:first_application/data/responses/responses.dart';
import 'package:first_application/domain/model/authentication.dart';
import 'package:first_application/data/network/request.dart';
import 'package:first_application/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:first_application/domain/repository/repository.dart';

class RepositoryImpl extends Repository {
  RemoteDataSource _remoteDataSource;

  RepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    try {
      final response = await _remoteDataSource.login(loginRequest);
      if (response.success == true) {
        //eğer api bize başarı dönüyorsa rightin içine bilgileri atıyoruz
        return Right(response.toDomain());
      } else {
        return Left(Failure(409, response.exceptions?[0] ?? "Hata Oluştu"));
      }
    } catch (error) {
      return Left(Failure(404, "hata"));
    }
  }
}
