import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../dataprovider/remote/firebase_auth_helper.dart';
import 'LogIn.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Page",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                //To DO SignOut
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LogIn()));
                await FireBaseHelper().SignOut();
              },
              icon: Icon(Icons.logout))
        ],
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
          child: Text(
              "Welcome To Home Page ${FirebaseAuth.instance.currentUser!.displayName.toString()}")),
    );
  }
}
