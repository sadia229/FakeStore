import 'dart:convert';
import 'package:fake_shop/constants/local_db_constant.dart';
import 'package:fake_shop/service/internet_service.dart';
import 'package:fake_shop/service/navigation_service.dart';
import 'package:fake_shop/src/features/home/views/home_page.dart';
import 'package:fake_shop/styles/k_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

//import 'package:nb_utils/nb_utils.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'api.dart';

class Network {
  static String noInternetMessage = "Check your connection!";

  static getRequest(String endPoint,
      {bool requireToken = true, bool noBaseUrl = false}) async {

    Response response;
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    print('\nURL: ${API.base}$endPoint');
    print("Headers: $headers\n");
    if (requireToken) {
      response = await get(
        Uri.parse(noBaseUrl ? endPoint : '${API.base}$endPoint'),
        headers: headers,
      );
    } else {
      response = await get(
        Uri.parse(noBaseUrl ? endPoint : '${API.base}$endPoint'),
      );
    }
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

      if (response.statusCode == 403) {
        /// Session expired
        // toast('Session expired! Login to continue...', bgColor: KColor.red);

        //setValue(loggedIn, false);
        NavigationService.navigateToReplacement(
            CupertinoPageRoute(builder: (_) => const HomePage()));
      } else if (response.statusCode == 422) {
        /// Custom validation message
        // toast(
        //   '${jsonDecode(response.body)['messages'][0]}',
        //   bgColor: KColor.red,
        // );
      } else if (response.statusCode == 429) {
        /// Too many attempts message
        // toast(
        //   '${jsonDecode(response.body)['message']}',
        //   bgColor: KColor.red,
        // );
      } else if (response.statusCode == 402) {
        /// Custom validation message
        // toast(
        //   '${jsonDecode(response.body)['messages']}',
        //   bgColor: KColor.red,
        // );
      } else if (response.statusCode == 401 || response.statusCode == 404) {
        /// Custom message
        if (jsonDecode(response.body)['message'] == "Unauthenticated.") {
          //toast('Login to continue...', bgColor: KColor.red);

          //setValue(loggedIn, false);
          NavigationService.navigateToReplacement(
              CupertinoPageRoute(builder: (_) => const HomePage()));
        } else {
          //toast('${jsonDecode(response.body)['message']}', bgColor: KColor.red);
        }
        if (jsonDecode(response.body)['unverified'] != null) {
          if (jsonDecode(response.body)['unverified']) {
            if (response.body.isNotEmpty) return json.decode(response.body);
          }
        }
      } else {
        //toast('Something went wrong!', bgColor: KColor.red);
      }
    }
  }
}
