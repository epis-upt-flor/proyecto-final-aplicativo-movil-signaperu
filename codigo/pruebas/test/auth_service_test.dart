import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'mocks/mock_classes.mocks.dart';
import 'package:lenguaje/services/auth_service.dart'; // ✅ Corrige el import

void main() {
  group('AuthService', () {
    late MockFirebaseAuth mockFirebaseAuth;
    late MockGoogleSignIn mockGoogleSignIn;
    late MockGoogleSignInAccount mockGoogleSignInAccount;
    late MockGoogleSignInAuthentication mockGoogleSignInAuth;
    late MockUserCredential mockUserCredential;
    late MockUser mockUser;

    late AuthService authService;

    setUp(() {
      mockFirebaseAuth = MockFirebaseAuth();
      mockGoogleSignIn = MockGoogleSignIn();
      mockGoogleSignInAccount = MockGoogleSignInAccount();
      mockGoogleSignInAuth = MockGoogleSignInAuthentication();
      mockUserCredential = MockUserCredential();
      mockUser = MockUser();

      // ✅ Usa el constructor test de tu AuthService
      authService = AuthService.test(
        auth: mockFirebaseAuth,
        googleSignIn: mockGoogleSignIn,
      );
    });

    test('signInWithGoogle retorna un usuario en un inicio de sesión exitoso', () async {
      // Arrange
      when(mockGoogleSignIn.signIn())
          .thenAnswer((_) async => mockGoogleSignInAccount);
      when(mockGoogleSignInAccount.authentication)
          .thenAnswer((_) async => mockGoogleSignInAuth);
      when(mockGoogleSignInAuth.accessToken).thenReturn('testAccessToken');
      when(mockGoogleSignInAuth.idToken).thenReturn('testIdToken');

      final credential = GoogleAuthProvider.credential(
        accessToken: 'testAccessToken',
        idToken: 'testIdToken',
      );

      when(mockFirebaseAuth.signInWithCredential(any))
          .thenAnswer((_) async => mockUserCredential);
      when(mockUserCredential.user).thenReturn(mockUser);

      // Act
      final user = await authService.signInWithGoogle();

      // Assert
      expect(user, isNotNull);
      verify(mockGoogleSignIn.signIn()).called(1);
      verify(mockFirebaseAuth.signInWithCredential(any)).called(1);
    });
  });
}
