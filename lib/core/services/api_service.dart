import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

class TimedResponse extends http.Response {
  final int responseTime;

  TimedResponse(super.body, super.statusCode,
      {required this.responseTime, Map<String, String>? headers})
      : super(headers: headers ?? <String, String>{});
}

class ApiService {
  static Future<String> _getAuthToken() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // return prefs.getString('auth_token') ?? '';
    return "";
  }

  static Future<TimedResponse> getRequest(String url,
      {Map<String, String>? params}) async {
    String token = await _getAuthToken();
    DateTime startTime = DateTime.now();

    http.Response res = await http.get(
      Uri.parse(url).replace(queryParameters: params),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': "token",
      },
    );

    int responseTime = DateTime.now().difference(startTime).inMilliseconds;
    return TimedResponse(res.body, res.statusCode,
        responseTime: responseTime, headers: res.headers);
  }

  static Future<TimedResponse> postRequest(
      String url, Map<String, dynamic> body) async {
    String token = await _getAuthToken();
    DateTime startTime = DateTime.now();

    http.Response res = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': token,
      },
      body: jsonEncode(body),
    );

    int responseTime = DateTime.now().difference(startTime).inMilliseconds;
    return TimedResponse(res.body, res.statusCode,
        responseTime: responseTime, headers: res.headers);
  }

  static Future<TimedResponse> putRequest(
      String url, Map<String, dynamic> body) async {
    String token = await _getAuthToken();
    DateTime startTime = DateTime.now();

    http.Response res = await http.put(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': token,
      },
      body: jsonEncode(body),
    );

    int responseTime = DateTime.now().difference(startTime).inMilliseconds;
    return TimedResponse(res.body, res.statusCode,
        responseTime: responseTime, headers: res.headers);
  }

  static Future<TimedResponse> delete(String url) async {
    String token = await _getAuthToken();
    DateTime startTime = DateTime.now();

    http.Response res = await http.delete(
      Uri.parse(url),
      headers: {'x-auth-token': token},
    );

    int responseTime = DateTime.now().difference(startTime).inMilliseconds;
    return TimedResponse(res.body, res.statusCode,
        responseTime: responseTime, headers: res.headers);
  }

  static Future<TimedResponse> multipartRequest({
    required String url,
    required Map<String, String> fields,
    Map<String, String>? files,
  }) async {
    String token = await _getAuthToken();
    DateTime startTime = DateTime.now();

    http.MultipartRequest request =
    http.MultipartRequest('POST', Uri.parse(url))
      ..headers['x-auth-token'] = token
      ..fields.addAll(fields);

    if (files != null) {
      for (var entry in files.entries) {
        request.files
            .add(await http.MultipartFile.fromPath(entry.key, entry.value));
      }
    }

    http.StreamedResponse streamedResponse = await request.send();
    http.Response res = await http.Response.fromStream(streamedResponse);

    int responseTime = DateTime.now().difference(startTime).inMilliseconds;
    return TimedResponse(res.body, res.statusCode,
        responseTime: responseTime, headers: res.headers);
  }
}
