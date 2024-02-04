import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_loginout_auth/pages/mainscreens/home_page.dart';
import 'package:firebase_loginout_auth/pages/authentication/login_or_register_page.dart';
import 'package:firebase_loginout_auth/pages/mainscreens/navbar.dart';

import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
         
          if (snapshot.hasData) {
            return MyHomePage();
          }
        
          else {
            return LoginOrRegister();
          }
        },
      ),
    );
  }
}
