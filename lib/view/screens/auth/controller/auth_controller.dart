import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithGoogle() async {
    try {
      // Initialize Google Sign-In
      final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

      // Trigger authentication flow
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        debugPrint('🚨 User cancelled sign-in');
        return null;
      }

      // Get auth details
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create credential
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase
      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );

      // Get user details
      final User? user = userCredential.user;

      if (user != null) {
        debugPrint('✅ Successfully signed in!');
        debugPrint('🟢 User UID: ${user.uid}');
        debugPrint('🟢 Email: ${user.email}');
        debugPrint('🟢 Display Name: ${user.displayName}');
        debugPrint('🟢 Photo URL: ${user.photoURL}');

        return user;
      } else {
        debugPrint('🚨 No user returned after sign-in');
        return null;
      }
    } on FirebaseAuthException catch (e) {
      debugPrint('🔥 Firebase Error: ${e.code} - ${e.message}');
      _handleFirebaseAuthError(e);
      rethrow;
    } catch (e) {
      debugPrint('🚨 Unexpected error: $e');
      rethrow;
    }
  }

  void _handleFirebaseAuthError(FirebaseAuthException e) {
    String message;
    switch (e.code) {
      case 'account-exists-with-different-credential':
        message =
            'An account already exists with the same email but different sign-in credentials.';
        break;
      case 'invalid-credential':
        message = 'The credential is malformed or has expired.';
        break;
      case 'operation-not-allowed':
        message = 'Google Sign-In is not enabled in Firebase Console.';
        break;
      case 'user-disabled':
        message = 'This user account has been disabled.';
        break;
      case 'user-not-found':
        message = 'No user found for this email.';
        break;
      case 'wrong-password':
        message = 'Incorrect password.';
        break;
      case 'network-request-failed':
        message = 'Network error occurred. Please check your connection.';
        break;
      default:
        message = 'An unknown error occurred.';
    }
    debugPrint('🔥 Firebase Auth Error: ${e.code} - $message');
  }
}
