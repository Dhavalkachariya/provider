import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favouriteprovider.dart';


class providerthree extends StatefulWidget{
  const providerthree({super.key});

  @override
  State<providerthree> createState() => _providerthreeState();
}

class _providerthreeState extends State<providerthree>{

  List<int> select = [];
  @override
  Widget build(BuildContext context){
    // final favouriteprovider = Provider.of<FavouriteItem>(context);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text("favorite"),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  itemCount: 100,
                    itemBuilder: (context ,index){
                    return Consumer<FavouriteItem>(builder: (context,value,child){
                      return ListTile(
                        onTap: (){
                          if(value.select.contains(index)){
                            value.removeItem(index);
                          }else{
                            value.addItem(index);
                          }



                        },
                        title:  Text("index:"+index.toString()),
                        trailing: Icon(
                            value.select.contains(index) ?Icons.favorite :Icons.favorite_border_outlined
                        ),
                      );
                    });

                })
            )
          ],
        ),
      ),
    );
  }
}