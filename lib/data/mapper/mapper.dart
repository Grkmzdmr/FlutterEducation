import 'dart:developer';

import 'package:first_application/app/extensions.dart';
import 'package:first_application/data/responses/responses.dart';
import 'package:first_application/domain/model/authentication.dart';

extension UserResponseMapper on Data? {
  UserData toDomain() {
    return UserData(this?.id?.orZero() ?? 0, this?.sign?.orEmpty() ?? "",
        this?.token?.orEmpty() ?? "");
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(this?.data?.toDomain());
  }
}
