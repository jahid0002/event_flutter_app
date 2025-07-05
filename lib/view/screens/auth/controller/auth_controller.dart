import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:event_app/core/routes/app_routes.dart';
import 'package:event_app/helper/loader/popup_loader.dart';
import 'package:event_app/helper/shared_prefe/shared_prefe.dart';
import 'package:event_app/service/api_check.dart';
import 'package:event_app/service/api_client.dart';
import 'package:event_app/service/api_url.dart';
import 'package:event_app/utils/app_const/app_const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signInWithGoogle() async {
    PopupLoader.showPopupLoader(Get.context!);
    try {
      // Initialize Google Sign-In
      final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

      // Trigger authentication flow
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        debugPrint('🚨 User cancelled sign-in');
        PopupLoader.hidePopupLoader(Get.context!);
        return;
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
        debugPrint('🟢 Phone Number: ${user.phoneNumber}');

        var body = {
          "token": googleAuth.idToken,
          "provider": "google", // google | apple | facebook
          "phoneType": Platform.isIOS ? "ios" : "android",
        };

        var response = await ApiClient.postData(
          ApiUrl.login,
          jsonEncode(body),
        ).timeout(const Duration(seconds: 10));

        if (response.statusCode == 200 || response.statusCode == 201) {
          SharePrefsHelper.setString(
            AppConstants.bearerToken,
            response.body['data']['accessToken'],
          );
          PopupLoader.hidePopupLoader(Get.context!);
          if (response.body['data']['isRegistrationComplete'] == false) {
            Get.offAllNamed(AppRoutes.onbordingScreen);
          } else {
            Get.offAllNamed(AppRoutes.homeScreen);
          }
        } else {
          PopupLoader.hidePopupLoader(Get.context!);
          ApiChecker.checkApi(response);
        }

        await googleSignIn.disconnect();
        return;
      } else {
        debugPrint('🚨 No user returned after sign-in');
        return;
      }
    } on FirebaseAuthException catch (e) {
      debugPrint('🔥 Firebase Error: ${e.code} - ${e.message}');
      PopupLoader.hidePopupLoader(Get.context!);
      _handleFirebaseAuthError(e);
    } on TimeoutException catch (_) {
      PopupLoader.hidePopupLoader(Get.context!);
      debugPrint('🚨 API call timed out');
    } catch (e) {
      PopupLoader.hidePopupLoader(Get.context!);
      debugPrint('🚨 Unexpected error: $e');
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
