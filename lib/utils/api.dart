

import 'dart:convert';

import 'app_helper.dart';
import 'package:http/http.dart' as http;

Future<bool> userLogin(String emailId, String passowrd) async {
  var params = {
    "email": emailId,
    "password": passowrd,
  };

  var url = Uri.parse("https://api-nodejs-todolist.herokuapp.com/user/login");

  String body = json.encode(params);

  // Since I am calling the apis for demo, I have not created a constant class to save the base URL or for product
  // flavours but yes the url will not be statically added here in the real project.


  print(body);
  var response = await http.post(
    url,
    headers: {"Content-Type": "application/json"},
    body: body,
  );
  print("apiResponse::: ${response.body}");
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}