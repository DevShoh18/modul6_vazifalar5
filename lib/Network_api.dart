import 'dart:convert';

import 'package:http/http.dart';

class Network_API {

  // http://dummy.restapiexample.com/api/v1/employees

  static String BASE = 'http://dummy.restapiexample.com';
  static String API = '/api/v1/employees';
  static String create = '/api/v1/create';
  static String update = '/api/v1/update/21';
  static String deleted = '/api/v1/delete/2';

  static Future<String?> GET(String api, Map<String, String> params) async{
    var uri = Uri.tryParse(BASE + api);
    var response = await get(uri!);
    if(response.statusCode == 200){
      //
      // log(response.body);
      return response.body;
    }
    return null;
  }
  static Future<String?> POST(String api, Map<String , String> params) async{
    var uri = Uri.tryParse(BASE + api);
    var response = await post(uri!, body : jsonEncode(params));
    if(response.statusCode == 200 || response.statusCode == 201){
      return response.body;
    }
    return null;
  }
  static Future<String?> PUT(String api, Map<String, String> params) async{
    print(params.toString());
    var uri = Uri.tryParse(BASE + api);
    var response = await post(uri!,body: jsonEncode(params));
    if(response.statusCode == 200){
      return response.body;
    }
    return null;
  }
  static Future<String?> DELETED(String api)async{
    var uri = Uri.tryParse(BASE + api);
    var response = await delete(uri!);
    if(response.statusCode==200){
      return response.body;
    }
    return null;
  }

  static Map<String,String> paramsEmpty(){
    Map<String, String> params = {};
    return params;
  }

}