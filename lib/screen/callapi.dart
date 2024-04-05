import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class api extends StatefulWidget{
  const api({super.key});


  @override
  State<api> createState() => _apiState();
}


class _apiState extends State<api>{

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('call api'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getapi(),

              builder: (context,snapshot) {
                return ListView.builder(
                  itemCount: data.length,
                    itemBuilder: (context ,index){
                      return Card(
                        child: Column(
                          children: [
                            ReusbaleRow(title: 'name', value: data[index]['name'].toString(),),
                            ReusbaleRow(title: 'city', value: data[index]['address']['city'].toString(),),
                            ReusbaleRow(title: 'company', value: data[index]['company']['name'].toString(),),

                          ],
                        ),
                      );

                    });

              },
            ),
          ),
        ],
      ),
    );

  }

  var data;
  Future<void> getapi() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if(response.statusCode == 200){
      data = jsonDecode(response.body.toString());
    }else{

    }


  }

}

class ReusbaleRow extends StatelessWidget {
  String title , value ;
  ReusbaleRow({Key? key , required this.title , required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value ),

        ],
      ),
    );
  }
}


