abstract class ILoginService {
  Future<bool> loginUsers(String email, String senha);
}

class ILoginServiceException implements Exception {
  final String? message;

  ILoginServiceException(this.message);
}
