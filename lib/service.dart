import 'dart:convert';
import 'package:http/http.dart' as http;

import 'json/contacts.dart';

const String baseUrl = 'https://reqres.in/api/users/';

class Services {

  Future<List> getContact() async {
    var response = await http.get(Uri.parse('https://reqres.in/api/users?page=1'));

    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      List<dynamic> datas = map['data'];
      return datas;
    } else {
      return Future.error('Server Error.');
    }
  }

  Future postContact(String firstName, String lastName, String email) async {
    var data = {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
    };
    var headers = {'Content-Type': 'application/json'};

    var response = await http.post(
      Uri.parse(baseUrl),
      body: jsonEncode(data),
      headers: headers,
    );
    try {
      if (response.statusCode == 201) {
        Map<String, dynamic> map = jsonDecode(response.body);
      List<dynamic> datas = map['data'];
      return datas;
      } else {
        return Future.error('Error');
      }
    } catch (socketException) {
      return throw Exception('Failed to Create bew Contact.');
    }
  }

  Future putContact(String api) async {}

  Future<Datum> deleteContact(String id) async {
    var deleteUrl = 'https://reqres.in/api/users/$id';
    var response = await http.get(Uri.parse(deleteUrl));

    if (response.statusCode == 204) {
      return Datum.fromJson(jsonDecode(response.body));
    } else {
      return Future.error('Server Error.');
    }
  }

  Future getSingleContact(String id) async {
    var profile = 'https://reqres.in/api/users/$id';
    var response = await http.get(Uri.parse(profile));
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      List<dynamic> data = map['data'];
      return data;
    } else {
      return Future.error('Server Error.');
    }
  }
}
