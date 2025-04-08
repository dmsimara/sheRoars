import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> registerUser({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      if (password != confirmPassword) {
        throw Exception('Passwords do not match');
      }

      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      if (user != null) {
        await _saveUserDetails(user, name);
      }

      return user;
    } catch (e) {
      print('Error during registration: $e');
      throw Exception('Registration failed: ${e.toString()}');
    }
  }

  Future<void> _saveUserDetails(User user, String name) async {
    try {
      print('User saved successfully with UID: ${user.uid}');
    } catch (e) {
      print('Error saving user details: $e');
    }
  }
}