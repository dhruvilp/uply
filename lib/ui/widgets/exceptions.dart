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

class BadRequest implements Exception {
  String errorMessage() => "Bad request!";
  String toString() => errorMessage();
}

class CompanyNotFound implements Exception {
  String errorMessage() => "Company not found!";
  String toString() => errorMessage();
}
