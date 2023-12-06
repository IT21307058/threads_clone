import 'package:flutter/material.dart';
import 'package:threads_clone/screens/authentication/login_screen.dart';
import 'package:threads_clone/utils/colors.dart';
import 'package:threads_clone/widgets/button.dart';
import 'package:threads_clone/widgets/text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Image.asset(
                "assets/threads.png",
                height: 80,
              ),
              const SizedBox(
                height: 30,
              ),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: secondaryColor,
                    backgroundImage: const NetworkImage(
                        'https://1fid.com/wp-content/uploads/2022/06/cartoon-profile-picture-12-1024x1024.jpg'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.circular(30),
                      ),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.add_a_photo),
                          color: Colors.yellow.shade600),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
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
                height: 10,
              ),
              TextInputField(
                hintText: 'Enter a Password',
                controller: _passwordController,
                isPassword: true,
                inputKeyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 10,
              ),
              TextInputField(
                hintText: 'Enter a Username',
                controller: _userNameController,
                isPassword: false,
                inputKeyboardType: TextInputType.name,
              ),
              const SizedBox(
                height: 10,
              ),
              TextInputField(
                hintText: 'Enter a Bio',
                controller: _bioController,
                isPassword: false,
                inputKeyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 10,
              ),
              SubmitButton(
                onPressed: () {},
                text: "Register",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an Account",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ));
                      },
                      child: Text(
                        "Log in",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
