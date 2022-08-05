class RestResponse<T>{
  int statusCode;
  bool success;
  String message;
  dynamic error;
  T? data;

  RestResponse(
      {
        this.statusCode = 200,
        required this.success,
        required this.error,
        required this.data,
        this.message = ""
      }
  );
}