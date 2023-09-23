import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../gConfgEnv/EnvVariable.dart';

class GoogleApiHandler {
  static final GoogleApiHandler _instance = GoogleApiHandler.internal();
  GoogleApiHandler.internal();
  factory GoogleApiHandler() => _instance;

  Future<dynamic> resolveLatLng(String latLng, BuildContext context) async {
    try {
      return checkInternetAccess(context, false).then((resCheckInternet) {
        if (resCheckInternet == true) {
          return http
              .get(
            Uri.parse(
                ('${GOOGLE_MAP_API_URL}geocode/json?latlng=$latLng&key=$API_MAP_KEY')),
            headers: GOOGLE_MAP_HEADER,
          )
              .then((http.Response response) async {
            if (response.statusCode == 200) {
              dynamic prpRes = jsonDecode(response.body);
              if (prpRes['status'].toString().toLowerCase().trim() == "ok") {
                return {
                  'status': true,
                  'data': (prpRes['results']),
                  'message': "success"
                };
              } else {
                return {
                  'status': false,
                  'data': [],
                  'message':
                      (prpRes['error_message'].toString().toLowerCase().trim())
                };
              }
            }
            return {
              'status': false,
              'data': {},
              'message':
                  ("${response.statusCode} : ${response.body}, Something went wrong, please try again")
            };
          });
        } else {
          return {
            'status': false,
            'data': {},
            'message': ("Unable to Reach $GOOGLE_MAP_DOMAIN_CHECK")
          };
        }
      });
    } catch (exErr) {
      print(
          '\n================================>service.google-api.dart resolveLatLng Exception');
      print(exErr);
      return {'status': false, 'data': {}, 'message': ("EX : $exErr")};
    }
  }

  Future<dynamic> resolveAddress(String address, BuildContext context) async {
    try {
      return checkInternetAccess(context, true).then((resCheckInternet) {
        if (resCheckInternet == true) {
          return http
              .get(
            Uri.parse(
                ('${GOOGLE_MAP_API_URL}geocode/json?address=${(address.toString().toLowerCase().trim().replaceAll(RegExp('[^a-zA-Z0-9]+'), " ")).split(" ").join("+")}&key=$API_MAP_KEY')),
            headers: GOOGLE_MAP_HEADER,
          )
              .then((http.Response response) async {
            if (response.statusCode == 200) {
              dynamic prpRes = jsonDecode(response.body);
              if (prpRes['status'].toString().toLowerCase().trim() == "ok") {
                return {
                  'status': true,
                  'data': (prpRes['results']),
                  'message': "success"
                };
              } else {
                return {
                  'status': false,
                  'data': [],
                  'message':
                      (prpRes['error_message'].toString().toLowerCase().trim())
                };
              }
            }
            return {
              'status': false,
              'data': {},
              'message':
                  ("${response.statusCode} : ${response.body}, Something went wrong, please try again")
            };
          });
        } else {
          return {
            'status': false,
            'data': {},
            'message': ("Unable to Reach $GOOGLE_MAP_DOMAIN_CHECK")
          };
        }
      });
    } catch (exErr) {
      print(
          '\n================================>service.google-api.dart resolveLatLng Exception');
      print(exErr);
      return {'status': false, 'data': {}, 'message': ("EX : $exErr")};
    }
  }

  Future<dynamic> getDistance(
      String origins, String destinations, BuildContext context) async {
    try {
      return checkInternetAccess(context, false).then((resCheckInternet) {
        if (resCheckInternet == true) {
          return http
              .get(
            Uri.parse(
                ('${GOOGLE_MAP_API_URL}distancematrix/json?units=metric&origins=${origins.toString().trim()}&destinations=${destinations.toString().trim()}&key=$API_MAP_KEY')),
            headers: GOOGLE_MAP_HEADER,
          )
              .then((http.Response response) async {
            if (response.statusCode == 200) {
              dynamic prpRes = jsonDecode(response.body);
              if (prpRes['status'].toString().toLowerCase().trim() == "ok") {
                return {'status': true, 'data': (prpRes), 'message': "success"};
              } else {
                return {
                  'status': false,
                  'data': [],
                  'message':
                      (prpRes['error_message'].toString().toLowerCase().trim())
                };
              }
            }
            return {
              'status': false,
              'data': {},
              'message':
                  ("${response.statusCode} : ${response.body}, Something went wrong, please try again")
            };
          });
        } else {
          return {
            'status': false,
            'data': {},
            'message': ("Unable to Reach $GOOGLE_MAP_DOMAIN_CHECK")
          };
        }
      });
    } catch (exErr) {
      print(
          '\n================================>service.google-api.dart resolveLatLng Exception');
      print(exErr);
      return {'status': false, 'data': {}, 'message': ("EX : $exErr")};
    }
  }

  checkInternetAccess(BuildContext context, bool isSilent) async {
    try {
      final result = await InternetAddress.lookup(GOOGLE_MAP_DOMAIN_CHECK)
          .timeout(const Duration(seconds: 9));
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        if (context.runtimeType == Null || isSilent == false) {
        } else {
          showAlertDialog(
              context, ("Unable to Reach $GOOGLE_MAP_DOMAIN_CHECK"));
        }
        return false;
      }
    } on SocketException catch (_) {
      if (context.runtimeType == Null || isSilent == false) {
      } else {
        showAlertDialog(context, ("Unable to Reach $GOOGLE_MAP_DOMAIN_CHECK"));
      }
      return false;
    }
  }

  showAlertDialog(BuildContext context, String message) {
    Widget cancelButton = TextButton(
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFF673AB7),
      ),
      child: const Text(
        "Ok",
        style: TextStyle(
          color: Color(0xFFFFFFFF),
        ),
      ),
      onPressed: () {
        Navigator.pop(context, true);
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text(message.toString().trim()),
      actions: [
        cancelButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
