import 'package:flutter/material.dart';
import './sign_in_screen.dart';
import 'package:dio/dio.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final Dio _dio = Dio();
  final _responseMessage = '';

  Future<void> resetPassword() async {
    final url = 'https://shubertaraslab12test.requestcatcher.com/test';


    final data = 'email=${_emailController.text}';


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
              Center(
                child: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/1024px-Google-flutter-logo.svg.png",
                  width: 200,
                ),
              ),
              const SizedBox(height: 50.0),

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

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    resetPassword();
                  }
                },
                child: const Text("Reset password"),
              ),
              const SizedBox(height: 24.0),

              if (_responseMessage.isNotEmpty)
                Text(
                  _responseMessage,
                  style: const TextStyle(color: Colors.green),
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
          ),
        ),
      ),
    );
  }
}
