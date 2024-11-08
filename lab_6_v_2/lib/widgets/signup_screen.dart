import 'package:flutter/material.dart';
import './sign_in_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/1024px-Google-flutter-logo.svg.png",
                width: 200,
              ),
            ),
            const SizedBox(height: 50.0),


            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16.0),

            const TextField(
              decoration: InputDecoration(
                labelText: 'Login',
                hintText: 'Enter your Login',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),


            const TextField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24.0),

            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll<Color>(Colors.green), // Колір фону
                        foregroundColor: WidgetStatePropertyAll<Color>(Colors.white), // Колір тексту
                      ),
                      onPressed: () {
                      },
                      child: const Text("Sign up"),
                    ),
                  ),
                ),

              ],
            ),
            const SizedBox(height: 24.0),

            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: ElevatedButton(
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
                  ),
                ),

              ],
            ),
            const SizedBox(height: 24.0),
          ],
        ),
      ),
    );

    throw UnimplementedError();
  }

}