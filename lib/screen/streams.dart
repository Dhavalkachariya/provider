import 'package:flutter/material.dart';


class StreamScreen extends StatefulWidget{
  const StreamScreen({super.key});

  @override
 State<StreamScreen> createState() => _StreamScreenState();
}

class _StreamScreenState extends State<StreamScreen>{

  Stream<DateTime> getStream() async*{

    while(true){
      await Future.delayed(const Duration(seconds: 1));
     yield DateTime.now();
    }
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream build'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius:  BorderRadius.circular(20),
                  gradient: LinearGradient(
                      colors: [
                        Colors.lightGreen,
                        Colors.yellowAccent
                      ]
                  )
              ),
              child: Center(
                child: StreamBuilder(
                  stream: getStream(),
                  builder: (context,snapshot) {
                    return Text(snapshot.data.toString(),
                      style: TextStyle(color: Colors.cyanAccent,fontWeight: FontWeight.bold),);
                 }

                  )
                  )
                ),
                  ]
              ),
            ),
        );
  }
}