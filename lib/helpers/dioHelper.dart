import 'dart:io';
import 'package:digou/models/webmodels/response.dart';
import 'package:dio/dio.dart';

enum RequestType { GET, POST }

class Http {
  static int _time = 0; //调用次数
  // ignore: non_constant_identifier_names
  static String _TOKEN;
  // ignore: non_constant_identifier_names
  static String _ACCOUNTID;
  static const int _CONNECT_TIME_OUT = 15000;
  static const int _RECEIVE_TIME_OUT = 15000;

  static Dio _dio;

  static void login(String token, String accountId) {
    if (_dio != null) {
      _dio.options.headers['token'] = token;
      _dio.options.headers['accountId'] = accountId;
    } else {
      _TOKEN = token;
      _ACCOUNTID = accountId;
    }
  }

  InterceptorsWrapper interceptorsWrapper = InterceptorsWrapper(
      onRequest: (options) {},
      onResponse: (response) async {},
      onError: (e) async {});
  // _dio 的初始化
  Http._init() {
    if (_dio == null) {
      BaseOptions options = new BaseOptions(
          connectTimeout: _CONNECT_TIME_OUT,
          receiveTimeout: _RECEIVE_TIME_OUT,
          headers: {
            HttpHeaders.acceptHeader: "accept: application/json",
            'token': _TOKEN,
            'accountId': _ACCOUNTID
          });
      _dio = new Dio(options);
    }
  }

  //get请求
  static Future<dynamic> get(String url, {dynamic formData}) async =>
      await _request(url, type: RequestType.GET, formData: formData);

  //post请求
  static Future<dynamic> post(String url, {dynamic formData}) async =>
      await _request(url, type: RequestType.POST, formData: formData);

  //post请求
  static Future<dynamic> postUpload(String url,
          {FormData formData, ProgressCallback progressCallBack}) async =>
      await _request(url,
          type: RequestType.POST,
          formData: formData,
          progressCallback: progressCallBack);

  static Future<dynamic> _request(String url,
      {RequestType type,
      dynamic formData,
      ProgressCallback progressCallback,
      CancelToken cancelToken}) async {
    cancelToken = cancelToken ?? CancelToken();
    Http._init();
    int _count = ++_time;
    Response response;

    var result;
    if (type == RequestType.GET)
      response = await _dio.get(url,
          cancelToken: cancelToken, queryParameters: formData);
    else
      response = await _dio.post(url,
          cancelToken: cancelToken,
          onSendProgress: progressCallback,
          data: formData);
    if (response != null) {
      if (response.data is List) {
        result = response.data[0];
      } else {
        result = response.data;
      }
      print('HTTP_REQUEST_URL::请求序号[$_count]::$url');
      print('HTTP_REQUEST_BODY::请求序号[$_count]::${formData ?? ''}');
      print('HTTP_RESPONSE_BODY::请求序号[$_count]::${response.data}');
    }
    return result;
  }
}
