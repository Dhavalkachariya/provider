import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SharedpreferanceWidget extends StatefulWidget{
  const SharedpreferanceWidget({super.key});

  @override
  State<SharedpreferanceWidget> createState() => _SharedpreferanceWidgetState();

}


class _SharedpreferanceWidgetState extends State<SharedpreferanceWidget>{

  // String fname = '';

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('sharedprefrance'),
      ),

      body: FutureBuilder(
            future: SharedPreferences.getInstance(),
              builder: (context ,AsyncSnapshot<SharedPreferences> snapshot){
             return ListView.builder(
                 itemCount: 2,
                 itemBuilder: (context,index){
               return Column(
                 children: [
                   Text(snapshot.data!.getString('name').toString()),
                   Text(snapshot.data!.getInt('age').toString()),
                   Text(snapshot.data!.getDouble('lucky').toString()),
                   Text(snapshot.data!.getBool('login_user').toString()),
                 ],
               );
             });
              }
              ),



      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          SharedPreferences sp = await SharedPreferences.getInstance();
          sp.clear();

          sp.setInt('age', 20);
          sp.setString('name', 'dhaval');
          sp.setDouble('lucky', 14.45);
          sp.setBool('login_user', true);

          // fname = sp.getString('name') ?? '';

          // print(sp.get('age'));
          // print(sp.get('name'));
          // print(sp.get('lucky'));
          // print(sp.get('login_user'));

          setState(() {

          });

        },
        child:const Icon(Icons.add),
      ),

    );
  }
}