// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants/routes.dart';
import '../../../widgets/primary_button/primary_button.dart';
import '../../../widgets/top_titles/top_titles.dart';
import '../../splitscreen/splitscreen.dart';
import '../sign_up/sign_up.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isShowPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopTitles(subtitle: "Welcome Back to AquaSPARK", title: "Login"),
              const SizedBox(height: 60.0),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: "Email",
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                controller: passwordController,
                obscureText: isShowPassword,
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: const Icon(Icons.password_outlined),
                  suffixIcon: CupertinoButton(
                    onPressed: () {
                      setState(() {
                        isShowPassword = !isShowPassword;
                        print(isShowPassword);
                      });
                    },
                    padding: EdgeInsets.zero,
                    child: const Icon(Icons.visibility, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              PrimaryButton(
                title: "Login",
                onPressed: () {
                  // Navigate to another screen here.
                  Routes.instance.push(widget: ConsumptionManagementPage(), context: context);
                },
              ),
              const SizedBox(height: 12.0),
              const Center(
                child: Text("Don't have an account?"),
              ),
              const SizedBox(height: 12.0),
              CupertinoButton(
                onPressed: () {
                  Routes.instance.push(widget: const SignUp(), context: context);
                },
                child: const Center(
                  child: Text(
                    "Create an account",
                    style: TextStyle(color: Colors.green),
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
