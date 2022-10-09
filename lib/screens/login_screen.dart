import 'dart:math';
import 'package:flutter/material.dart';
import 'package:most_secured_login_joke/widgets/custom_button.dart';
import 'package:most_secured_login_joke/widgets/custom_text_form_field.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool obscurePassword = true;
  int selectedNum = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLoginButton(num: [0, 1, 2]),
            const SizedBox(height: 20),
            _buildLoginButton(num: [3, 4, 5]),
            const SizedBox(height: 20),
            _buildLoginButton(num: [6, 7, 8]),
            const SizedBox(height: 20),
            CustomTextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              title: 'Email',
              hintText: 'Enter email',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Email is required';
                } else if (!RegExp(
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                    .hasMatch(value)) {
                  return 'Email is invalid';
                } else {
                  return null;
                }
              },
            ),
            CustomTextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              title: 'Password',
              hintText: 'Enter password',
              isPassword: true,
              obscurePassword: obscurePassword,
              obscureIcon: IconButton(
                icon: obscurePassword
                    ? const Icon(Icons.visibility, color: Colors.grey)
                    : const Icon(Icons.visibility_off, color: Colors.grey),
                onPressed: () {
                  setState(() {
                    obscurePassword = !obscurePassword;
                  });
                },
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Password is required';
                } else if (value.length < 6) {
                  return 'Password minimum 6 characters';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: 30),
            _buildLoginButton(num: [9, 10, 11]),
            const SizedBox(height: 30),
            _buildLoginButton(num: [12, 13, 14]),
            const SizedBox(height: 30),
            _buildLoginButton(num: [15, 16, 17]),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginButton({required List<int> num}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (var item in num)
          if (item == selectedNum) ...[
            CustomButton(
              text: 'Login',
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    selectedNum = 10;
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  });
                } else {
                  setState(() {
                    selectedNum = Random().nextInt(17);
                  });
                }
              },
            ),
          ] else ...[
            const SizedBox(height: 40, width: 100),
          ],
      ],
    );
  }
}
