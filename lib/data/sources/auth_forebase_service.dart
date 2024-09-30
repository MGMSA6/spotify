import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/data/models/auth/signin_user_req.dart';

abstract class AuthForebaseService {
  Future<Either> register(CreateUserReq createUserReq);

  Future<Either> signIn(SigninUserReq signinUserReq);
}

class AuthForebaseServiceImpl extends AuthForebaseService {
  @override
  Future<Either> register(CreateUserReq createUserReq) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserReq.email, password: createUserReq.password);

      FirebaseFirestore.instance
          .collection('Users')
          .add({'name': createUserReq.fullName, 'email': data.user?.email});

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
  Future<Either> signIn(SigninUserReq signinUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: signinUserReq.email, password: signinUserReq.password);

      return const Right('Signin was successful!');
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'Not User found for this acccount';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong Password.';
      }
      return Left(message);
    }
  }
}
