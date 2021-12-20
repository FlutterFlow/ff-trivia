import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class FFTriviaFirebaseUser {
  FFTriviaFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

FFTriviaFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<FFTriviaFirebaseUser> fFTriviaFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<FFTriviaFirebaseUser>(
            (user) => currentUser = FFTriviaFirebaseUser(user));
