// ignore_for_file: unused_local_variable

import 'package:fireauth/firebase_options.dart';
import 'package:fireauth/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'screens/LogIn.dart';

int currentVersion = 1;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: fetchDataFromFirestore('version', '1'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text('Error: ${snapshot.error}'),
              ),
            );
          } else {
            if (snapshot.data['working'] == false) {
              return const StartMyApp();
            } else {
              return Scaffold(
                body: Center(
                  child: Text(snapshot.data['Message']),
                ),
              );
            }
          }
        },
      ),
    );
  }
}

Widget start() {
  if (FirebaseAuth.instance.currentUser != null) {
    return const Home();
  } else {
    return const LogIn();
  }
}

class StartMyApp extends StatelessWidget {
  const StartMyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      home: start(),
    );
  }
}

Future fetchDataFromFirestore(String collection, String documentId) async {
  try {
    var documentSnapshot = await FirebaseFirestore.instance
        .collection(collection)
        .doc(documentId)
        .get();
    return documentSnapshot;
  } catch (e) {
    // Handle errors appropriately
    rethrow;
  }
}

Future updateDataToFirestore(
    String collection, String documentId, Map<String, dynamic> data) async {
  try {
    await FirebaseFirestore.instance
        .collection(collection)
        .doc(documentId)
        .update(data);
  } catch (e) {
    // Handle errors appropriately
    rethrow;
  }
}

Future deleteDataFromFirestore(String collection, String documentId) async {
  try {
    await FirebaseFirestore.instance
        .collection(collection)
        .doc(documentId)
        .delete();
  } catch (e) {
    // Handle errors appropriately
    rethrow;
  }
}
