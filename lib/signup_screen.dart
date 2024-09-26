import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email = "";
  String _password = "";
  void _handleSignUp() async{
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      );
    }catch(e)
    {
      print("Error During Registration: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.help),
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child:Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
                validator: (value)
                {
                  if(value == null || value.isEmpty)
                    {
                      return 'Please enter email';
                    }
                  return null;
                },
                onChanged: (value){
                  setState(() {
                    _email = value;
                  });
                },
              ),
              const SizedBox(height: 15,),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
                validator: (value)
                {
                  if(value == null || value.isEmpty)
                  {
                    return 'Please enter password';
                  }
                  return null;
                },
                onChanged: (value){
                  setState(() {
                    _password = value;
                  });
                },
              ),
              const SizedBox(height: 15,),
              ElevatedButton(
                  onPressed: _signupToNextPhase,
                  child: const Text('Sign Up')
              ),
            ],
          ),
        ),
      ),
    ),);
  }

  void _signupToNextPhase(){
    if(_formKey.currentState!.validate())
      {
        _handleSignUp();
      }
  }

}
