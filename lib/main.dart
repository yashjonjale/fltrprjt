// ignore_for_file: unused_import

import 'dart:core';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:duser/pages/login.dart';
import 'package:duser/pages/details.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  DatabaseReference drf = FirebaseDatabase.instance.ref();
  DatabaseEvent eve = await drf.once();
  dynamic map = eve.snapshot.value;
  print(map["22b0990"]["name"]);
  runApp( MaterialApp(routes:{
      "/": (context) => const Login(),
      "/details":(context) => Details()
    },
    initialRoute: "/",));
}


