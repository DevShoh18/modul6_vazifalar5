import 'dart:convert';
import 'package:http/http.dart';
import 'dart:developer';
class Network{
   static String BASE = "https://jsonplaceholder.typicode.com";
   static Map<String, String> headers = {'Content-Type':'application/json; charset=UTF-8'};

  static String API_LIST = "/posts";
  static String API_CREATE = "/posts";
  static String API_UPDATE = "/posts/";
  static String API_DELETE = "/posts/";

  static Future<String?> GET(String api, Map<String, String> params) async{
    var uri = Uri.tryParse('http://dummy.restapiexample.com/api/v1/employees');
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
    var response = await post(uri!, headers: headers,body : jsonEncode(params));
    if(response.statusCode == 200 || response.statusCode == 201){
      return response.body;
    }
    return null;
  }
  static Future<String?> PUT(String api, Map<String, String> params) async{
    print(params.toString());
    var uri = Uri.tryParse(BASE + api);
    var response = await post(uri!, headers : headers, body: jsonEncode(params));
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