import 'dart:async';

import 'package:fireauth/screens/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseHelper {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future signOut() async {
    await auth.signOut();
  }

  Future SignUp(String userNmae, String Password, String Email) async {
    try {
      UserCredential user = await auth.createUserWithEmailAndPassword(
          email: Email, password: Password);
      await auth.currentUser!.updateDisplayName(userNmae);
      await auth.currentUser!.reload();

      return user.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-password') {
        return "Password Isn't correct";
      }
    }
  }
}
