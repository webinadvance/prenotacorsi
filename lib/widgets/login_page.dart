import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:prenotacorsi/widgets/main_scaffold.dart';

import '../store.dart';

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
    return MainScaffold(
      isDrawerVisible: true,
      title: "prenotacorsi.com",
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                /*  image: DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1527186504227-0a47da29a0d0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=803&q=80"),
                    fit: BoxFit.cover,
                  ),*/
              ),
              child: Center(
                child: Text("prenotacorsi.com".toUpperCase(),
                    style: Theme.of(context).textTheme.headlineLarge),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: MaterialButton(
              padding: const EdgeInsets.all(16),
              onPressed: () {
                _signInWithGoogle().then(
                      (UserCredential userCredential) {
                    print(userCredential.user);
                    StoreProvider.of<AppState>(context)
                        .dispatch(SetUserAction(userCredential.user));
                  },
                ).catchError((e) => print(e));
              },
              color: Theme.of(context).colorScheme.primary,
              textColor: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.login),
                  SizedBox(width: 8),
                  Text("Login with Google"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
