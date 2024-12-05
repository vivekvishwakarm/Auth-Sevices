import 'package:flutter/material.dart';
import 'package:login_logout/auth_services.dart';
import 'package:login_logout/home_screen.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Authentication'), centerTitle: true,),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(

                onPressed: () async {

                  // Call sign-up function
                  var user = await _authService.signUpWithEmail(emailController.text, passwordController.text);
                  if (user != null) {
                    // Handle successful sign-up
                      print('User registered: ${user.email}');
                  }
                },

                child:const  Text('Sign Up'),
              ),
              ElevatedButton(

                onPressed: () async {

                  // Call sign-in function
                  var user = await _authService.signInWithEmail(passwordController.text, passwordController.text);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
                  if (user != null) {
                    // Handle successful sign-in
                    print('User signed in: ${user.email}');
                  }
                },

                child: const Text('Sign In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
