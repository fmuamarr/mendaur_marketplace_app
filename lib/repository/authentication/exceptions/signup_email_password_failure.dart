class SignUpEmailPasswordFailure {
  final String message;

  const SignUpEmailPasswordFailure([this.message = "An unkown error occured."]);

  factory SignUpEmailPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignUpEmailPasswordFailure(
            'Password lemah, masukkan password lebih kuat.');
      case 'invalid-email':
        return const SignUpEmailPasswordFailure(
            'Email tidak valid atau Format email tidak sesuai.');
      case 'email-already-in-use':
        return const SignUpEmailPasswordFailure('Email telah digunakan.');
      case 'operation-not-allowed':
        return const SignUpEmailPasswordFailure('Error operation-not-allowed');
      case 'user-disabled':
        return const SignUpEmailPasswordFailure('User has been disabled.');
      default:
        return SignUpEmailPasswordFailure();
    }
  }
}
