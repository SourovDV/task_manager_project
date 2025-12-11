import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

class NetworkResponse {
  final int statusCode;
  final bool isSuccess;
  final String? errorSms;
  final Map<String, dynamic>? responseData;

  NetworkResponse({
    required this.statusCode,
    required this.isSuccess,
    this.errorSms,
    this.responseData,
  });
}

class NetworkCaller {
  static Future<NetworkResponse> getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      debugPrint("$uri");
      Response response = await get(uri);
      debugPrint("${response.statusCode}");
      debugPrint("response data=> ${response.body}");
      if (response.statusCode == 200) {
        final decodeData = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodeData,
        );
      } else {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorSms: "Something happend",
        );
      }
    } catch (e) {
      return NetworkResponse(
          statusCode: -1, isSuccess: false, errorSms: e.toString());
    }
  }

  static Future<NetworkResponse> postRequest({required String url, Map<String, dynamic> ? body}) async {
    try {
      Uri uri = Uri.parse(url);
      debugPrint("uri => $uri");
      Response response = await post(
          uri,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(body));
      debugPrint("statusCode => ${response.statusCode}");
      debugPrint('response data => ${response.body}');
      if (response.statusCode == 200) {
        final decode = jsonDecode(response.body);
        return NetworkResponse(statusCode: response.statusCode,
            isSuccess: true,
            responseData: decode);
      } else {
        return NetworkResponse(
            statusCode: response.statusCode, isSuccess: false);
      }
    } catch (e) {
      return NetworkResponse(
          statusCode: -1, isSuccess: false, errorSms: e.toString());
    }
  }

}
