import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/create_user_req.dart';
import 'package:spotify/data/models/signin_user_req.dart';
import 'package:spotify/data/sources/auth_forebase_service.dart';
import 'package:spotify/domain/repository/auth.dart';
import 'package:spotify/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> register(CreateUserReq createUserReq) async {
    return await sl<AuthForebaseService>().register(createUserReq);
  }

  @override
  Future<Either> signIn(SigninUserReq signinUserReq) async {
    return await sl<AuthForebaseService>().signIn(signinUserReq);
  }
}
