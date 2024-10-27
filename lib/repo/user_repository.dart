import 'dart:async';
import 'dart:convert';
import 'dart:io' show Platform;
import 'dart:math';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

String generateNonce([int length = 32]) {
  const charset =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
  final random = Random.secure();
  return List.generate(length, (_) => charset[random.nextInt(charset.length)])
      .join();
}

String sha256ofString(String input) {
  final bytes = utf8.encode(input);
  final digest = sha256.convert(bytes);
  return digest.toString();
}

class UserRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  UserRepository({FirebaseAuth? firebaseAuth, GoogleSignIn? googleSignin})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignin ??
            GoogleSignIn(scopes: <String>[
              'email',
              'profile'
            ]); // https://stackoverflow.com/questions/64079246/how-to-get-additional-scopes-from-googlesignin-in-flutter

  User? currentSignedinUser() {
    return _firebaseAuth.currentUser;
  }

  Future<User?> signInWithGoogle() async {
    print("signInWithGoogle step a1");
    try {
      await _googleSignIn.signOut();
    } catch (t) {
      // ignore
    }
    try {
      print("signInWithGoogle step a2");
      final googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        print("signInWithGoogle step a2.1");
        final googleAuth = await googleUser.authentication;
        print("signInWithGoogle step a2.2");
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        print("signInWithGoogle step a2.3");
        await _firebaseAuth.signInWithCredential(credential);
        print("signInWithGoogle step a2.4");
        if (_firebaseAuth.currentUser != null) {

          // MOVE THIS TO SimpleQaComponent

          {

            final validateChampsAnswer = FirebaseFunctions.instance.httpsCallable('validateChampsAnswer');
            {
              final result = await validateChampsAnswer.call(
                  <String, dynamic>
                  {
                    'category': 'Frans',
                    'group': 'Vertalen',
                    'target': 'Vertalen van enkele simpele zinnetjes',
                    'ageGroup': '6',
                    'gender': 'female',
                    'question': "Wat is de vertaling van 'Ik ben blij' (als man)?",
                    'expectedAnswer': 'Je suis heureux',
                    'givenAnswer': 'Je suis heureux'
                  });
              final correct = result.data['correct'];
              final feedback = result.data['feedback'];
              print("correct: " + correct.toString());
              print("feedback: " + feedback);
            }
            // Generate a challenge question
            final generateChallengeQuestion = FirebaseFunctions.instance.httpsCallable('generateChallengeQuestion');
            {
              final result = await generateChallengeQuestion.call(
                  <String, dynamic>
                  {
                    'category': 'maths',
                    'group': 'Addition and Subtraction',
                    'target': 'solve simple problems in a practical context involving addition and subtraction of money of the same unit, including giving change. Question is for UK children, so use £.',
                    'ageGroup': '6',
                    'amount': 2,
                    'choices': 3,
                  });
              List results = result.data;
              for (int i = 0; i < results.length; i++) {
                final result = results[i];
                final question = result['question'];
                final answer = result['correctAnswer'];
                final timeInSeconds = result['timeInSeconds'];
                print("question: " + question);
                print("answer: " + answer);
                print("timeInSeconds: " + timeInSeconds.toString());
                print("");
              }
            }

            {
              final result = await generateChallengeQuestion.call(
                  <String, dynamic>
                  {
                    'category': 'Frans',
                    'group': 'Vertalen',
                    'target': 'Vertalen van enkele simpele zinnetjes. Als er verwarring zou kunnen zijn ivm het geslacht van de persoon, specifieer dan het geslacht in de vraag',
                    'ageGroup': '6',
                    'amount': 10,
                    'choices': 3,
                  });
              List results = result.data;
              for (int i = 0; i < results.length; i++) {
                final result = results[i];
                final question = result['question'];
                final answer = result['correctAnswer'];
                final timeInSeconds = result['timeInSeconds'];
                print("question: " + question);
                print("answer: " + answer);
                print("timeInSeconds: " + timeInSeconds.toString());
                print("");
              }
            }

          }

          return _firebaseAuth.currentUser!;
        }
        print("signInWithGoogle step a2.5");
        throw Exception('_firebaseAuth.currentUser is null');
      } else {
        throw Exception('User decided not to login');
      }
    } catch (t) {
      throw Exception('Exception during google sign in $t');
    }
  }

  Future<User?> signInWithGoogleNew() async {
    try {
      print("signInWithGoogle step 1");
      var googleUser = kIsWeb ? await (_googleSignIn.signInSilently()) : await (_googleSignIn.signIn());
      print("signInWithGoogle step 2");
      if (_googleSignIn == null)
      {
        print("_googleSignIn is null!!!!!!!!");
      } else {
        print("_googleSignIn is not null!!!!!!!!");
      }
      if (kIsWeb)
      {
        print("kIsWeb is true!!!!!!!!");
      } else {
        print("kIsWeb is false!!!!!!!!");
      }
      if (googleUser == null)
      {
        print("googleUser == null !!!!!!!!");
      } else {
        print("googleUser != null!!!!!!!!");
      }
      if (kIsWeb && googleUser == null) {
        print("trying...");
        googleUser = await _googleSignIn.signIn();
      }
      print("signInWithGoogle step 3");
      if (googleUser != null) {
        print("signInWithGoogle step a3");
        final googleAuth = await googleUser.authentication;
        print("signInWithGoogle step a4");
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        print("signInWithGoogle step a5");
        await _firebaseAuth.signInWithCredential(credential);
        if (_firebaseAuth.currentUser != null) {
          return _firebaseAuth.currentUser!;
        }
        print("signInWithGoogle step a6");
        throw Exception('_firebaseAuth.currentUser is null');
      } else {
        throw Exception('User decided not to login');
      }
    } catch (t) {
      throw Exception('Exception during google sign in $t');
    }
  }

  Future<User?> signInWithApple() async {
    if (kIsWeb) {
      return signInWithAppleOnWeb();
    } else {
      if (Platform.isIOS) {
        return signInWithAppleOnApple();
      } else {
        return signInWithProvider();
      }
    }
  }

  Future<User> signInWithAppleOnApple() async {
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    final oauthCredential = OAuthProvider('apple.com').credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );

    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(oauthCredential);

    if (userCredential.user?.displayName == null ||
        (userCredential.user?.displayName != null &&
            userCredential.user!.displayName!.isEmpty)) {
      final fixDisplayNameFromApple = [
        appleCredential.givenName ?? '',
        appleCredential.familyName ?? '',
      ].join(' ').trim();
      await userCredential.user?.updateDisplayName(fixDisplayNameFromApple);
    }
    if (userCredential.user?.email == null ||
        (userCredential.user?.email != null &&
            userCredential.user!.email!.isEmpty)) {
      await userCredential.user?.updateEmail(appleCredential.email ?? '');
    }

    if (_firebaseAuth.currentUser != null) return _firebaseAuth.currentUser!;
    throw Exception('_firebaseAuth.currentUser is null');
  }

  Future<User> signInWithProvider() async {
    AppleAuthProvider appleProvider = AppleAuthProvider();
    appleProvider.addScope('email');
    appleProvider.addScope('name');
    final credential =
        await FirebaseAuth.instance.signInWithProvider(appleProvider);
    if (credential.user != null) return credential.user!;
    throw Exception('credential.currentUser is null');
  }

  Future<User> signInWithAppleOnWeb() async {
    final provider = OAuthProvider('apple.com')
      ..addScope('email')
      ..addScope('name');

    await FirebaseAuth.instance.signInWithPopup(provider);
    if (_firebaseAuth.currentUser != null) return _firebaseAuth.currentUser!;
    throw Exception('_firebaseAuth.currentUser is null');
  }

  Future<List<void>> signOut() async {
    return Future.wait([_firebaseAuth.signOut(), _googleSignIn.signOut()]);
  }

  bool isSignedIn() {
    final currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }

  String? getUser() {
    return _firebaseAuth.currentUser!.email;
  }

  String? profilePhoto() {
    return _firebaseAuth.currentUser!.photoURL;
  }
}
