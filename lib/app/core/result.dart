sealed class Result<T> {
  const Result();

  factory Result.success(T value) => Success(value);
  factory Result.failure(String message) => Failure(message);

  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is Failure<T>;

  T getOrElse(T defaultValue) {
    return switch (this) {
      Success(value: final v) => v,
      Failure() => defaultValue,
    };
  }

  R fold<R>(
    R Function(T value) onSuccess,
    R Function(String message) onFailure,
  ) {
    return switch (this) {
      Success(value: final v) => onSuccess(v),
      Failure(message: final m) => onFailure(m),
    };
  }
}

final class Success<T> extends Result<T> {
  const Success(this.value);
  final T value;
}

final class Failure<T> extends Result<T> {
  const Failure(this.message);
  final String message;
} 