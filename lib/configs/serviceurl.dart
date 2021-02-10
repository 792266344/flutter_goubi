class Url {}

// final String _baseUrl = '115.59.41.122/';
final String _baseUrl = 'http://192.168.0.112:3000/mock/121/';
final String _digouAccountUrl = _baseUrl + 'digou-account/';

class DiGouAccount {
  static String account = 'account/';
  static String checkUserName =  _digouAccountUrl + account + 'checkUserName';
  static String login =  _digouAccountUrl + account + 'login';
}
