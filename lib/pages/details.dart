// ignore_for_file: unused_import, must_be_immutable

import 'dart:core';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';

class Details extends StatefulWidget {
  Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  String? username;
  dynamic map;
  String? name;
  String? sex;
  String? age;

  dynamic getData() async{
    DatabaseReference drf = FirebaseDatabase.instance.ref();
    DatabaseEvent eve = await drf.once();
    dynamic map=eve.snapshot.value;
    return map;
  }

  @override
  void initState() {
    super.initState();
    map = getData();

  }

  @override
  Widget build(BuildContext context) {
    dynamic arguments = ModalRoute.of(context)?.settings.arguments;
    username = arguments['uid'];
    name = map[username]["name"];
    age = map[username]["Age"];
    sex = map[username]["sex"];
    return Scaffold(
      appBar: AppBar(
        title: Text("DETAILS",
          style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0,
          color: Colors.grey[200],
          ),
        ),

        backgroundColor: Colors.black,
        ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex : 2,
            child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Image.network(map[username]["imageLink"])
              ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("NAME : $name",
                    style: const TextStyle(
                        fontSize: 10.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                      ),
                    )

              )
            ),
        ]
      ,)
    );
  }
}
