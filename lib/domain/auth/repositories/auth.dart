import 'package:dartz/dartz.dart';
import 'package:movie_and_tv_show/data/auth/models/signup_req_params.dart';

import '../../../data/auth/models/signin_req_params.dart';

abstract class AuthRepository {
  Future<Either> signup(SignupReqParams params);
  Future<Either> signin(SigninReqParams params);
  Future<bool> isLoggedIn();
}
