class MyException {
  String title;
  String message;
  MyException({required this.title, required this.message});

  @override
  String toString() => '$title : $message';
}

class NoInternetException extends MyException {
  NoInternetException({required String msg})
    : super(title: "No Internet", message: msg);
}

//500 and above
class ServerException extends MyException {
  ServerException({required String msg})
    : super(title: "Server Error", message: msg);
}

class BadRequestException extends MyException {
  BadRequestException({required String msg})
    : super(title: "Bad Request", message: msg);
}

class UnauthorizedException extends MyException {
  UnauthorizedException({required String msg})
    : super(title: "UnAuthorised", message: msg);
}

//404 Not found
class NotFoundException extends MyException {
  NotFoundException({required String msg})
    : super(title: "Not Found", message: msg);
}

class InvalidInputException extends MyException {
  InvalidInputException({required String msg})
    : super(title: "Inalid Input", message: msg);
}
