import 'package:dartz/dartz.dart';
import 'package:first_application/data/network/request.dart';
import 'package:first_application/domain/model/authentication.dart';
import 'package:flutter/cupertino.dart';

import '../../data/network/failure.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);

 /* yorumat;
  yorumsil
  postpaylaş
  postbeğen
  postbeğenme
  kendisırrınıgizliyeal*/
}
