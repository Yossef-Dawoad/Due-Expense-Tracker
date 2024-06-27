sealed class Result<T> {
  final T? data;
  final String? err; //TODO ERROR TO BE Custom Base Exeption

  const Result(this.data, this.err);
}

final class Success<T> extends Result<T> {
  const Success(T? data) : super(data, null);
}

final class Failure<T> extends Result<T> {
  const Failure(String err) : super(null, err);
}

typedef FutureResult<T> = Future<Result<T>>;
