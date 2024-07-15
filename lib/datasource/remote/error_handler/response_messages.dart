class ResponseMessage {
  static const String SUCCESS = "Request successful"; // Success with data
  static const String NO_CONTENT = "No content"; // Success with no data (no content)
  static const String BAD_REQUEST = "Bad request"; // Failure, API rejected the request
  static const String UNAUTHORIZED = "Unauthorized"; // Failure, user is not authorized
  static const String FORBIDDEN = "Forbidden"; // Failure, API rejected the request
  static const String INTERNAL_SERVER_ERROR = "Internal server error"; // Failure, crash on the server side
  static const String NOT_FOUND = "Not found"; // Failure, resource not found

  // Local status codes
  static const String CONNECT_TIMEOUT = "Connection timeout";
  static const String CANCEL = "Request canceled";
  static const String RECEIVE_TIMEOUT = "Receive timeout";
  static const String SEND_TIMEOUT = "Send timeout";
  static const String CACHE_ERROR = "Cache error";
  static const String NO_INTERNET_CONNECTION = "No internet connection";
  static const String DEFAULT = "Something went wrong";
}
