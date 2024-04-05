import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/complexmodel.dart';

class Complexapi extends StatefulWidget{
  const Complexapi({super.key});

  @override
  State<Complexapi> createState() => _ComplexapiState();
}

class _ComplexapiState extends State<Complexapi>{
  @override
  Widget build(BuildContext context){
    return  Scaffold(
      appBar: AppBar(
        title: Text('complexApi'),
      ),
      body:Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      children: [
        Expanded(
          child: FutureBuilder<Complexapimodel>(
            future: getdata(),
            builder: (context , snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                    itemCount: snapshot.data!.entries.length,
                    itemBuilder: (context, index){
                      return Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(snapshot.data!.entries![index].description.toString()),
                            Text(snapshot.data!.entries![index].auth.toString()),
                            Text(snapshot.data!.entries![index].api.toString()),

                          ],
                        ),
                      );
                    });
              }else {
                return Text('Loading');
              }
            },
          ),
        )
      ],
    ),
    ),
    );
  }
  
  
  
  Future<Complexapimodel> getdata() async{
    final response = await http.get(Uri.parse('https://api.publicapis.org/entries'));
    var data = jsonDecode(response.body.toString());


    if(response.statusCode == 200){
      return Complexapimodel.fromJson(data);
    }else{
      return Complexapimodel.fromJson(data);
    }
  }
  
}