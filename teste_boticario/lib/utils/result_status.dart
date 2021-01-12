class ResultStatus<T> {
  final T data;
  final String error;

  ResultStatus._({this.data, this.error});

  factory ResultStatus.success(T data) = Success;
  factory ResultStatus.error(String error) = Error;
}

class Success<T> extends ResultStatus<T> {
  final T data;
  Success(this.data) : super._(data: data, error: "");
}

class Error<T> extends ResultStatus<T> {
  final String error;
  Error(this.error) : super._(error: error);
}
