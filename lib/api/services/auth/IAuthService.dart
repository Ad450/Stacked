abstract class IAuthService {
  Future<void> signupWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> signupWithGoogle();
  Future<String?> getCachedUser();
  Future<void> logout();
}
