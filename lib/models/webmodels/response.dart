abstract class BaseResponse<T> {
  int code;
  String message;
  T data;

  bool get isOk => this.code == 200;

  BaseResponse.fromJson(Map<String, dynamic> json) {
    this.code = json['code'];
    this.message = json['message'];
    this.data = convertData(json['data']);
  }

  T convertData(dynamic data) => data;
}

class SimpleResponse extends BaseResponse<dynamic> {
  SimpleResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}

class CommonResponse extends BaseResponse<Map<String, dynamic>> {
  CommonResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json);

  String getString(String key) => this.data[key];
  bool getBool(String key) => this.data[key];
  int getInt(String key) => this.data[key];
  double getDouble(String key) => this.data[key];
}
