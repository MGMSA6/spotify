import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/create_user_req.dart';

abstract class AuthRepository {
  Future<Either> register(CreateUserReq createUserReq);
  Future<void> signIn();
}
