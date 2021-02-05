abstract class BaseResponse<T>{
  int code;
  String message;
  T data;
}

class StringResponse extends BaseResponse<String>{
}