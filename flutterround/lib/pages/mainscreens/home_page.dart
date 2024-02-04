import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  SupportScreen({super.key});

  final user = FirebaseAuth.instance.currentUser!;

//! signout
  void signUserOutt() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        //  backgroundColor: Colors.black,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(onPressed: signUserOutt, icon: const Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          // Center(
          //     child: Text(
          //   "LOGGED IN AS: ${user.email!}",
          //   style: const TextStyle(fontSize: 20),
          // )),
        ],
      ),
    );
  }
}
