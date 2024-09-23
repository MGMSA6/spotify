import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/data/models/signin_user_req.dart';
import 'package:spotify/domain/repository/auth.dart';
import 'package:spotify/service_locator.dart';

class SigninUsecase implements Usecase<Either, SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq? params}) async {
    return sl<AuthRepository>().signIn(params!);
  }
}
