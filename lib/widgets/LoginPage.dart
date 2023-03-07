import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../state.dart';

class LoginPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId:
        '586633050644-iu7iink9u7ci0us2iq7rajsqvd44ofm7.apps.googleusercontent.com',
  );

  Future<UserCredential> _signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await _auth.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StoreConnector<AppState, User?>(
              converter: (store) => store.state.user,
              builder: (context, user) => user != null
                  ? Text("Logged in as ${user.displayName}")
                  : ElevatedButton(
                      child: Text("Login with Google"),
                      onPressed: () {
                        _signInWithGoogle().then(
                          (UserCredential userCredential) {
                            print(userCredential.user);
                            StoreProvider.of<AppState>(context)
                                .dispatch(SetUserAction(userCredential.user));
                          },
                        ).catchError((e) => print(e));
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
