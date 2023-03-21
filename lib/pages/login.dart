// ignore_for_file: unused_import

import 'dart:core';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
   
  String? username;
  DatabaseReference df = FirebaseDatabase.instance.ref();
  //dynamic map;

  dynamic chkData(String val) async{
    DatabaseReference drf = FirebaseDatabase.instance.ref();
    DatabaseEvent eve = await drf.once();
    DataSnapshot? snap=eve.snapshot;
    return snap.hasChild(val);
  }

  @override
  void initState(){
    super.initState();
    //map = getData();
    //print(map);

  }
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.black,
        title: Text("DUSER",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: Colors.grey[200],
          )
        ),
        centerTitle: true,
        //preferredSize: Size.fromHeight(80.0),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex:2,
            child:
              Container(
                padding: const EdgeInsets.all(100.0),
                child: Image.network("https://www.iconpacks.net/icons/2/free-user-icon-3296-thumb.png"),
              )
          ),
          Expanded(
              flex:1,
              child: Form(
                key: _formKey,
                child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      autofocus: false,
                      initialValue: 'userid',
                      decoration: const InputDecoration(
                        labelText: 'Enter your User-ID',
                        border: OutlineInputBorder(),
                      ),
                      

                      validator: (value){
                        if (value == null || value.isEmpty) {
                          return 'Please enter your correct user-id';
                        }
                        //bool f = map.containsKey(value);
                        /*if(f==null){
                          return 'Please enter your correct user-id';
                        }*/
                        if (!chkData(value)) {
                          return 'Please enter your correct user-id';
                        }
                        username=value;
                        return null;
                      }
                    ),
                  ),
                  Expanded(
                    flex:1,
                    child: FloatingActionButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() == true) {
                          Navigator.pushNamed(context, "/details",arguments: {"uid":"$username"});
                        }
                        else{
                          _formKey.currentState?.reset();
                        }
                      },
                      backgroundColor: Colors.black,
                      child: const Text("Go"),
                    ),
                  ),
                ],
              ),


              /*Container(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  autofocus: false,
                  initialValue: 'userid',
                  decoration: const InputDecoration(
                    labelText: 'Enter your User-ID',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value==null||value.isEmpty) {
                      return 'Please enter your correct user-id';
                    }
                    else if(){

                    }

                  },*/
                  //onSaved: () {
                    // Do something with the value
                  //},
                ),
              )

        ],
      ),


    );
  }
}
