import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebases_flutter/signin_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {

    String? _email = _auth.currentUser!.email;

    return Scaffold(
      appBar: AppBar(
          title: Text('Welcome Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('User login by $_email'),
            ElevatedButton(
              onPressed: (){
                _auth.signOut();
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInScreen()));
              },
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
