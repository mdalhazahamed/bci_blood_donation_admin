class Resource<T> {
  ResourceStatus status;
  T? response;
  String? message;
  String? stackTrace;
  int? messageCode;
  bool? isReadOnly;
  bool? isHLS;

  Resource({this.response, this.message, this.status = ResourceStatus.EMPTY, this.stackTrace, this.isReadOnly, this.messageCode = 0});

  factory Resource.fromApiResponse(dynamic response) {
    return Resource(
      response: response['data'],
      message: response['message'],
      messageCode: response['messageCode'],
      isReadOnly: response['isReadOnly'],
      status: response['isSuccess'] ? ResourceStatus.SUCCESS : ResourceStatus.FAILED,
    );
  }

  update(Resource resource) {
    message = resource.message;
    status = resource.status;
    stackTrace = resource.stackTrace;
    messageCode = resource.messageCode;
    isReadOnly = resource.isReadOnly;
  }
}

enum ResourceStatus {
  EMPTY,
  LOADING,
  SUCCESS, // When response.isSuccess = TRUE
  FAILED, // When response.isSuccess = FALSE
}
