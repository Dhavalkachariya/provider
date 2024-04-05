import 'package:api/screen/callapi.dart';
import 'package:api/screen/complexapi.dart';
import 'package:api/provider/countprovider.dart';
import 'package:api/provider/countscreen.dart';
import 'package:api/provider/exampletwoprovider.dart';
import 'package:api/provider/favouriteprovider.dart';
import 'package:api/provider/providerthree.dart';
import 'package:api/provider/providertwo.dart';
import 'package:api/screen/sharedpref.dart';
import 'package:api/screen/streams.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => Countprovider(),
          ),
          ChangeNotifierProvider(
            create: (_) => exampletwoprovider(),
          ),
          ChangeNotifierProvider(
            create: (_) => FavouriteItem(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
          ),
          home: const providerthree(),
        ) ,

    );
  }
}

