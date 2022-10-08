import 'package:flutter/material.dart';
import 'package:modul6_vazifa5/Network_api.dart';

class Vazifa extends StatefulWidget {
  const Vazifa({Key? key}) : super(key: key);

  @override
  State<Vazifa> createState() => _VazifaState();
}

class _VazifaState extends State<Vazifa> {
   String data ='APIdan malumot kelmadi.';



   @override
   void initState(){
     apiresponce();
     super.initState();
   }


   void apiresponce() async {
     await Network_API.DELETED(Network_API.deleted).then((value) => {
       setState(() {
         data = value!;
         print(data);
       })
     });
   }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Deleted'),centerTitle: true,),
      body: ListView(
        children:[ Container(
          child: Text(data !=null ? data : "Not Found.", ),
        ),]
      ),
    );
  }
}
