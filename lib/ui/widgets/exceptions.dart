///=======================================
///          EXCEPTION HANDLERS
///=======================================

class UserNotFound implements Exception {
  String errorMessage() => "User not found!";
  String toString() => errorMessage();
}

class SomethingWentWrong implements Exception {
  String errorMessage() => "Something went wrong!";
  String toString() => errorMessage();
}
