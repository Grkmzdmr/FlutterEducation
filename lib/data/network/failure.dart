class Failure {
  int code;
  String message;

  Failure(this.code, this.message);
}

class DefaultFailure extends Failure {
  DefaultFailure() : super(-1, "Hata Oluştu");
}



