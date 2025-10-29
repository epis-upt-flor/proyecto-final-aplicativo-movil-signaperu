
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/annotations.dart';

// Indica qué clases quieres mockear
@GenerateMocks([FirebaseAuth, GoogleSignIn, GoogleSignInAccount, GoogleSignInAuthentication, UserCredential, User])
void main() {}
