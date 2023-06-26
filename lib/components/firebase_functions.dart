import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> signUp(
  FirebaseAuth auth,
  String email,
  String password,
) async {
  await auth.createUserWithEmailAndPassword(email: email, password: password);
}

Future<void> signIn(FirebaseAuth auth, String email, String password) async {
  await auth.signInWithEmailAndPassword(email: email, password: password);
}
