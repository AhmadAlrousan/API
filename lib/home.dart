import 'dart:ui';

import 'package:api/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  Future dataAPI() async
  {

    final http.Response res=await  http.get(Uri.parse('https://countriesnow.space/api/v0.1/countries/info?returns=currency,dialcode'));

    if(res.statusCode==200)
      {
        var obj= json.decode(res.body);
        return await obj;

      }else Exception("error");

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API"),
      ),
      body: Center(
        child: FutureBuilder(
          future:dataAPI() ,
          builder: ( ctx , snap){
            if (snap.data == null){
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }else {
              return ListView.builder(
                itemBuilder: (Context, index) {
                  return ListTile(
                    title: Text(
                      snap.data.toString(), style: TextStyle(fontSize: 22),),
                  );
                },
              );
            }
          },
        ),
      ) ,
    );
  }
}






// Future<dynamic> dataAPI() async
// {
//   const url='https://countriesnow.space/api/v0.1/countries/info?returns=currency,flag,unicodeFlag,dialCode';
//
//   final http.Response res=await  http.get(Uri.parse(url));
//   if (res.statusCode==200){
//     var obj= json.decode(res.body);
//     return await obj;
//
//   }else
//   {
//     print("Error!");
//   }
// }
//





