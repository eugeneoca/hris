import 'dart:convert';

import 'package:http/http.dart' as http;

dynamic loginUser(username, password) async {
  final url = Uri.parse("http://localhost:3000/api/auth/login");
  final payload = {"username": username, "password": password};
  final body = jsonEncode(payload);
  final response = await http.post(headers: {
    "Accept": "application/json",
    "Content-Type": "application/json"
  }, url, body: body);
  return jsonDecode(response.body);
}
