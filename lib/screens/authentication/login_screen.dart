import 'package:flutter/material.dart';
import 'package:threads_clone/screens/authentication/register_screen.dart';
import 'package:threads_clone/widgets/button.dart';
import 'package:threads_clone/widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Image.asset(
              'assets/threads.png',
              height: 80,
            ),
            const SizedBox(
              height: 30,
            ),
            TextInputField(
              hintText: 'Enter Email',
              controller: _emailController,
              isPassword: false,
              inputKeyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 30,
            ),
            TextInputField(
              hintText: 'Enter a password',
              controller: _passwordController,
              isPassword: true,
              inputKeyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 30,
            ),
            SubmitButton(text: "Login", onPressed: () {}),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don \' t have an account?",
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ));
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            )
          ],
        ),
      ),
    )));
  }
}
