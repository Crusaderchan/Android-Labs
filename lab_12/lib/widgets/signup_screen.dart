import 'package:flutter/material.dart';
import './sign_in_screen.dart';
import 'package:dio/dio.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final Dio _dio = Dio();
  final _responseMessage = '';

  Future<void> singUp() async {
    final url = 'https://shubertaraslab12test.requestcatcher.com/test';


    final data = 'email=${_emailController.text}&login=${_loginController.text}&password=${_passwordController.text}';



    final response = await _dio.post(
      url,
      data: data,
      options: Options(
        headers: {
          'Content-Type':  'text/plain',
        },
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),

                TextFormField(
                  controller: _loginController,
                  decoration: const InputDecoration(
                    labelText: 'Login',
                    hintText: 'Enter your login',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your login';
                    }
                  },
                ),
                const SizedBox(height: 24.0),


                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24.0),

                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      singUp();
                    }
                  },
                  child: const Text("Sing up"),
                ),
                const SizedBox(height: 24.0),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInScreen(),
                      ),
                    );

                  },
                  child: const Text("Back"),
                ),
                const SizedBox(height: 24.0),
              ],
            )
        )
      ),
    );

    throw UnimplementedError();
  }

}