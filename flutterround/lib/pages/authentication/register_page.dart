import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_loginout_auth/elements/my_button.dart';
import 'package:firebase_loginout_auth/elements/my_textfield.dart';
import 'package:firebase_loginout_auth/elements/square_tile.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
 
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();


  void signUserUp() async {

    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
    
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: usernameController.text, password: passwordController.text);
      } else {
     
        Navigator.pop(context);

        wrongErrorMessage("Passwords Don't match!");
      }
    
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
     
      Navigator.pop(context);
      print(e);
     wrongErrorMessage(e.code);
   
    }
  }

//! wrong credentials message popup
  void wrongErrorMessage(String message) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.black,
            title: Center(
                child: Text(
              message,
              style: TextStyle(color: Colors.white),
            )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          "Hello Welcome !",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              color: Colors.white),
                        ),
                        Text(
                          "Create Your New Account",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.white),
                        ),
                      ]),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      MyTextField(
                          controller: usernameController,
                          hintText: "Username",
                          obscureText: false),
                      const SizedBox(
                        height: 10,
                      ),
                      //pwd txtfld
                      MyTextField(
                          controller: passwordController,
                          hintText: "Password",
                          obscureText: true),
                      const SizedBox(
                        height: 10,
                      ),
                      //conform textfield
                      MyTextField(
                          controller: confirmPasswordController,
                          hintText: "Confirm Password",
                          obscureText: true),
                      const SizedBox(
                        height: 10,
                      ),
                      //forgot pwd

                      const SizedBox(
                        height: 25,
                      ),
                      //sign in button
                      MyButton(
                        text: "Sign Up",
                        onTap: signUserUp,
                      ),

                      const SizedBox(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an Account?",
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          GestureDetector(
                            onTap: widget.onTap,
                            child: const Text(
                              "Login now",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
