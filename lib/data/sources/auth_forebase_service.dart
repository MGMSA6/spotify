import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:spotify/data/models/create_user_req.dart';

abstract class AuthForebaseService {
  Future<Either> register(CreateUserReq createUserReq);

  Future<void> signIn();
}

class AuthForebaseServiceImpl extends AuthForebaseService {
  @override
  Future<Either> register(CreateUserReq createUserReq) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserReq.email, password: createUserReq.password);

      return const Right('Registration was successful!');
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The Password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exsist with that email.';
      }
      return Left(message);
    }
  }

  @override
  Future<void> signIn() {
    throw UnimplementedError();
  }
}
