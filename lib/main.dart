import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Load(),
    );
  }
}
class Load extends StatefulWidget {
  const Load({Key? key}) : super(key: key);

  @override
  State<Load> createState() => _LoadState();
}

class _LoadState extends State<Load> {
  @override
  Widget build(BuildContext context) {
    List data;
    return Scaffold(
      body:Container(
        child:Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString('load_json/person.json'),
            builder: (context, snapshot) {
              var mydata=json.decode(snapshot.data.toString());
              return ListView.builder(
                  itemBuilder: (context, index) {
                     return Card(
                       child:Column(
                         crossAxisAlignment: CrossAxisAlignment.stretch,
                         children: [
                           Text("Name"+mydata[index]["name"]),
                           Text("Age"+mydata[index]["age"]),
                           Text("Name"+mydata[index]["number"]),
                         ],
                       ) ,
                     );
                  },
              itemCount: mydata==null? 0 :mydata.length,
              );

            },
             ),
        ) ,
      ),
    );
  }
}

