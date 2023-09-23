import 'dart:io';
import 'dart:async';
import 'dart:convert';
import '../gConfgEnv/EnvVariable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();
}

const String domainCheckUrl = DOMAIN_CHECK;

class ApiHandler {
  static final ApiHandler _instance = ApiHandler.internal();
  ApiHandler.internal();
  factory ApiHandler() => _instance;

  Future<dynamic> customGet(String fullUrl) async {
    try {
      return checkInternetAccess().then((resCheckInternet) {
        if (resCheckInternet == true) {
          return http
              .get(
            Uri.parse(fullUrl.toString()),
            headers: GET_HEADER,
          )
              .then((http.Response response) async {
            if (response.statusCode == 200) {
              return jsonDecode(response.body);
            }
            return null;
          });
        } else {
          return {
            'status': false,
            'data': {},
            'message': "Slow / No Internet Connection"
          };
        }
      });
    } catch (exErr) {
      if (kDebugMode) {
        debugPrint('\n8=====>catch in side customGet');
        debugPrint(exErr.toString());
      }
      return null;
    }
  }

  Future<dynamic> post(dynamic body) async {
    try {
      return checkInternetAccess().then((resCheckInternet) {
        if (resCheckInternet == true) {
          return getDeviceInfo().then((value) {
            // log(BASE_URL.toString());
            // log(body.toString());
            return http
                .post(
              Uri.parse(BASE_URL.toString()),
              headers: value,
              body: (jsonDecode(jsonEncode(body))),
              encoding: Encoding.getByName('utf-8'),
            )
                .then((response) {
              if (response.statusCode == 200) {
                if (response.body.isEmpty ||
                    response.body.runtimeType == Null ||
                    response.body.toString().trim().toLowerCase() == "null" ||
                    response.body.toString().trim().isEmpty) {
                  return {
                    'status': false,
                    'data': body,
                    'message': 'Blank Response From Server',
                    'command': (body["f"].toString())
                  };
                } else {
                  return jsonDecode(response.body.toString());
                }
              }
              return {
                'status': false,
                'data': [],
                'message': response.body.toString()
              };
            }, onError: (errRes) {
              return {
                'status': false,
                'data': [],
                'message': errRes.toString()
              };
            });
          });
        } else {
          return {
            'status': false,
            'data': [],
            'message': "Slow / No Internet Connection",
          };
        }
      });
    } catch (exErr) {
      if (kDebugMode) {
        debugPrint('\n8=====>catch in side post');
        debugPrint(exErr.toString());
      }
      return {'status': false, 'data': [], 'message': exErr.toString()};
    }
  }

  Future<bool> checkInternetAccess() async {
    try {
      final result = await InternetAddress.lookup(domainCheckUrl).timeout(
        const Duration(
          seconds: 9,
        ),
      );
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }
}