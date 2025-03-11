import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:tut_app/data/constants.dart';
import 'package:tut_app/data/response/responses.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppApi {
  factory AppApi(Dio dio, {String baseUrl}) = _AppApi;
  @POST("/customer/login")
  Future<AuthenticationResponse> login(
    @Field("email") String email,
    @Field("password") String password,
  );
}
