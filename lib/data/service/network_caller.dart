import 'dart:convert';

import 'package:http/http.dart';

class NetworkRespons {
  final int statusCode;
  final bool  isSucessed;
  final Map<String, dynamic>? responsdata;
  final String? errorMessage;

  NetworkRespons({
    required this.statusCode,
    required this.isSucessed,
    this.responsdata,
    this.errorMessage,
  });
}

class NetworkCaller {
  Future<NetworkRespons> getRequest({required String url}) async {
    try {
      Uri uri = await Uri.parse(url);
      Response response = await get(uri);
      if (response.statusCode == 200) {
        final decode = jsonDecode(response.body);
        return NetworkRespons(
          statusCode: response.statusCode,
          isSucessed: true,
          responsdata: decode,
        );
      } else {
        return NetworkRespons(
          statusCode: response.statusCode,
          isSucessed: false,
        );
      }
    } catch (e) {
      return NetworkRespons(
        statusCode: -1,
        isSucessed: false,
        errorMessage: e.toString(),
      );
    }
  }
  Future<NetworkRespons> postRequest({required String url,required Map<String,dynamic> body}) async {
    try {
      Uri uri = await Uri.parse(url);
      Response response = await post(uri,
        headers: {
        "Content-Type": "application/json",
      },
        body: jsonEncode(body),);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final decode = jsonDecode(response.body);
        return NetworkRespons(
          statusCode: response.statusCode,
          isSucessed: true,
          responsdata: decode,
        );
      } else {
        return NetworkRespons(
          statusCode: response.statusCode,
          isSucessed: false,
        );
      }
    } catch (e) {
      return NetworkRespons(
        statusCode: -1,
        isSucessed: false,
        errorMessage: e.toString(),
      );
    }
  }


}
