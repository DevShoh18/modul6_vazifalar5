import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'Network.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  String data  = "Z";
  // "https://jsonplaceholder.typicode.com/posts"


  void _apiGet() async{
     await Network.GET('/posts', Network.paramsEmpty()).then((value) => {
     setState(() {
       data = value!;
     })
     });
  }

  @override
  void initState(){
    _apiGet();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Get'), centerTitle: true,),
      body: ListView(
        children : [ Center(
          child: Text(data !=null ? data : 'Not data',style: TextStyle(color: Colors.black),),
        ),
          ]
      ),
      );
  }
}
