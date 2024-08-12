import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:lugia/core/services/api.dart';
import 'package:lugia/creations/models/api.dart';

class CreationsApiService {
  static Future<StoreCreationResponse> storeCreation(String prompt) async {
    final url = CoreApiService.makeUri('api/v1/user/creations');
    final headers = await CoreApiService.makeHeaders();
    final body = jsonEncode({
      'prompt': prompt,
    });

    final request = http.Request('POST', url);
    request.headers.addAll(headers);
    request.body = body;

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    CoreApiService.handleError(response);

    return StoreCreationResponse.fromBytes(response.bodyBytes);
  }

  static Future<ListInspirationsResponse> listInspirations() async {
    final url = CoreApiService.makeUri('api/v1/user/creations/inspirations');
    final headers = await CoreApiService.makeHeaders();

    final request = http.Request('GET', url);
    request.headers.addAll(headers);

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    CoreApiService.handleError(response);

    return ListInspirationsResponse.fromBytes(response.bodyBytes);
  }
}
