enum Status { loading, done, error }

class AppResponse<T> {
  Status? status;
  T? body;
  String? message;

  AppResponse({
    this.status,
    this.body,
    this.message,
  });

  AppResponse.loading({
    this.message,
  }) : status = Status.loading;

  AppResponse.error(this.message) : status = Status.error;

  AppResponse.completed(this.body, {this.message}) : status = Status.done;

  bool get hasError => status == Status.error;
  bool get isLoading => status == Status.loading;
  bool get isCompleted => status == Status.done;
}
