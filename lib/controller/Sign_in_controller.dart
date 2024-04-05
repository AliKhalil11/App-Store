//

// ignore_for_file: unnecessary_nullable_for_final_variable_declarations, body_might_complete_normally_nullable, avoid_print, unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../views/Taps_view.dart';

class SigiIn extends GetxController {
  Future signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if(googleUser == null){
        return ;
        
      }

      if (googleUser != null) {
        // Obtain the auth details from the request
        final GoogleSignInAuthentication? googleAuth =
            await googleUser.authentication;

        if (googleAuth != null &&
            (googleAuth.accessToken != null || googleAuth.idToken != null)) {
          // Create a new credential
          final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          );

          // Once signed in, return the UserCredential
           await FirebaseAuth.instance.signInWithCredential(credential);
          Get.off(()=>const TapsPage());
        } else {
          throw Exception(
              "Failed to retrieve authentication details from Google.");
        }
      } else {
        throw Exception("Google sign-in process was canceled.");
      }
    } catch (e) {
      print("Error signing in with Google: $e");
      return null;
    }
  }
}
