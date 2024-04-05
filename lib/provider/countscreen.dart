import 'dart:async';

import 'package:api/provider/countprovider.dart';
import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:provider/provider.dart';


class countscreen extends StatefulWidget{
  const countscreen({super.key});

  State<countscreen> createState() => _countscreenState();
}

class _countscreenState extends State<countscreen>{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer.periodic(Duration(seconds: 1), (timer) {
      final countprovider = Provider.of<Countprovider>(context,listen: false);
      countprovider.setcount();

    });
  }

  Widget build(BuildContext context){
    final countprovider = Provider.of<Countprovider>(context,listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("provider"),
        backgroundColor: Colors.amberAccent,
      ),
      body: Center(
        child: Consumer<Countprovider>(
          builder: (context, value,child){
            return  Text(value.count.toString());
          },
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          countprovider.setcount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}