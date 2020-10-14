import 'dart:convert';

import 'package:http/http.dart' as http;

class RILQuery {
  Future<http.Response> register(String name, String email, String password, String confirmPassword) {
    return http.post(
      'http://localhost:5000/users/register',
      headers: <String, String>{},
      body: jsonEncode({"name": name, "email": email, "password": password, "password2": confirmPassword}),
    );
  }

  Future<http.Response> login(String email, String password) {
    return http.post(
      'http://localhost:5000/users/login',
      headers: <String, String>{},
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );
  }

  Future<http.Response> addResource(
      int resourceId, String text, String type, String userId, List<String> tags, String domain) {
    return http.post(
      'http://localhost:5000/resource/add/',
      headers: <String, String>{},
      body: jsonEncode({
        "resourceID": resourceId,
        "text": text,
        "type": type,
        "userID": userId,
        "read": false,
        "tags": tags,
        "domain": domain
      }),
    );
  }

  Future<http.Response> read(int resourceId) {
    return http.post(
      'http://localhost:5000/resource/read/',
      headers: <String, String>{},
      body: jsonEncode({
        "resourceID": resourceId,
        "read": true,
      }),
    );
  }
}

//          "name":"test",
//          "email":"testd@test.com",
//          "password":"abcdeft",
//          "password2":"abcdeft"

//        "resourceID": 1,
//        "text": "Reactor",
//        "type": "text",
//        "userID": "23",
//        "read": false,
//        "tags": ["NOT READ", "NEVER READ"],
//        "domain": "example.com"
