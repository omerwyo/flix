import 'dart:convert';

import 'package:http/http.dart';

import 'package:flix/util/nothing.dart';
import 'package:flix/util/request_type.dart';
import 'package:flix/util/request_type_exception.dart';

class FlixClient {
  static const String _baseUrl = "flix-be.azurewebsites.net";
  final Client _client;
  FlixClient(this._client);
  Future<Response> request(
      {required RequestType requestType,
      required String path,
      dynamic parameters = Nothing}) async {
    // 4
    switch (requestType) {
      case RequestType.GET:
        final uri = Uri.https(_baseUrl, "/$path", parameters);
        // print(uri.toString());
        return _client.get(uri);
      case RequestType.POST:
        return _client.post(Uri.parse("$_baseUrl/$path"),
            headers: {"Content-Type": "application/json"},
            body: json.encode(parameters));
      case RequestType.DELETE:
        return _client.delete(Uri.parse("$_baseUrl/$path"));
      default:
        return throw RequestTypeNotFoundException(
            "The HTTP request method is not found");
    }
  }
}
