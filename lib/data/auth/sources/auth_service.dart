import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_and_tv_show/constants/api_url.dart';
import 'package:movie_and_tv_show/core/network/dio_client.dart';
import 'package:movie_and_tv_show/data/auth/models/signin_req_params.dart';
import 'package:movie_and_tv_show/data/auth/models/signup_req_params.dart';
import 'package:movie_and_tv_show/service_locator.dart';

abstract class AuthService {
  Future<Either> signup(SignupReqParams params);
  Future<Either> signin(SigninReqParams params);
}

class AuthApiServiceImpl extends AuthService {
  @override
  Future<Either> signup(SignupReqParams params) async{
    try{
      var response = await sl<DioClient>().post(
        ApiUrl.signup,
        data: params.toMap()
      );
      return right(response.data);

    }on DioException catch(e) {
      return left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> signin(SigninReqParams params)async{
    try{
      var response = await sl<DioClient>().post(
          ApiUrl.signin,
          data: params.toMap()
      );
      return right(response.data);

    }on DioException catch(e) {
      return left(e.response!.data['message']);
    }
  }

}