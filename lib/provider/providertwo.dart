import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'exampletwoprovider.dart';


class providertwo extends StatefulWidget{
  const providertwo({super.key});

  @override
  State<providertwo> createState() => _providertwoState();
}

class _providertwoState extends State<providertwo>{
  @override
  Widget build(BuildContext context){
    // final provider = Provider.of<exampletwoprovider>(context,listen: false);
print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('provider two'),
        backgroundColor: Colors.teal,
      ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<exampletwoprovider>(builder: (context,value,child){
            return Slider(value: value.value, onChanged: (val){
              value.setValue(val);

            }
            );
          }),

          Consumer<exampletwoprovider>(builder: (context,value,child){
            return  Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.red.withOpacity(value.value)
                      ),
                      child: Text('Red'),
                    )
                ),
                Expanded(
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.green.withOpacity(value.value)
                      ),
                      child: Text('green'),
                    )
                )
              ],
            );
          }),


        ],
      ),
    ),
    );
  }
}
