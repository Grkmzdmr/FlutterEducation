import 'package:dio/dio.dart';
import 'package:first_application/app/constant.dart';
import 'package:first_application/data/responses/responses.dart';
import 'package:first_application/domain/model/authentication.dart';
import 'package:retrofit/retrofit.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("/account/login")
  Future<AuthenticationResponse> login(@Field("sign") String sign,
      @Field("password") String password, @Field("deviceId") String deviceId);
}
