import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:http/http.dart' as http;

import 'package:lugia/core/models/api.dart';

class CoreApiService {
  static Future<Map<String, dynamic>> getConfig() async {
    final url = CoreApiService.makeUri('api/v1/config');
    final headers = await CoreApiService.makeHeaders();

    final response = await http.get(url, headers: headers);

    CoreApiService.handleError(response);

    return jsonDecode(utf8.decode(response.bodyBytes));
  }

  static void handleError(http.Response response) {
    if (response.statusCode < 400) {
      return;
    }

    String error = 'Unknown error';
    try {
      Map body = jsonDecode(utf8.decode(response.bodyBytes));
      if (body.containsKey('error')) {
        error = body['error'];
      }
    } finally {
      //
    }

    final exception = ApiException(
      error: error,
      statusCode: response.statusCode,
    );

    FirebaseCrashlytics.instance.recordError(exception, null);

    throw exception;
  }

  static Uri makeUri(String path) {
    return kDebugMode
        ? Uri.https('a68f-104-28-237-72.ngrok-free.app', path)
        : Uri.https('next.centime.app', path);
  }

  static Future<Map<String, String>> makeHeaders() async {
    final extras = await Extras.create();

    if (FirebaseAuth.instance.currentUser == null) {
      await FirebaseAuth.instance.signInAnonymously();
    }

    final idToken = await FirebaseAuth.instance.currentUser!.getIdToken(false);

    return {
      'Authorization': idToken!,
      'Content-Type': 'application/json',
      'X-Locale': extras.localeName,
      'X-Operating-System': extras.operatingSystem,
      'X-Version': extras.version,
    };
  }
}
