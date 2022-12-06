import 'dart:convert';
import 'package:http/http.dart';
import 'api.dart';

class Network {
  static getRequest(String endPoint, {bool noBaseUrl = false}) async {
    Response response;
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    print('\nURL: ${API.base}$endPoint');
    print("Headers: $headers\n");

    response = await get(
      Uri.parse(noBaseUrl ? endPoint : '${API.base}$endPoint'),
      headers: headers,
    );
    return response;
  }

  static handleResponse(Response response) async {
    if (response.statusCode >= 200 && response.statusCode <= 210) {
      print('\nSuccessCode: ${response.statusCode}');
      print('SuccessResponse: ${response.body}\n');
      if (response.body.isNotEmpty) {
        return json.decode(response.body);
      } else {
        return response.body;
      }
    } else {
      print('\nErrorCode: ${response.statusCode}');
      print("ErrorResponse: ${response.body}\n");
    }
  }
}
