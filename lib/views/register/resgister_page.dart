import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/views/login/login_page.dart';
import 'package:shopping/views/login/widget/email_widget.dart';
import 'package:shopping/views/login/widget/password_widget.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();
  late final TextEditingController _userController = TextEditingController();

  late final TextEditingController _phoneController = TextEditingController();

  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _userController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "R E G I S T E R",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  EmailTextFeild(
                    hintText: "Username",
                    prefixIcon: const Icon(
                      Icons.person_2_outlined,
                      size: 22,
                      color: Colors.grey,
                    ),
                    controller: _userController,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  EmailTextFeild(
                    hintText: "Phone",
                    prefixIcon: const Icon(
                      Icons.person_2_outlined,
                      size: 22,
                      color: Colors.grey,
                    ),
                    controller: _phoneController,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  EmailTextFeild(
                    hintText: "Email",
                    prefixIcon: const Icon(
                      CupertinoIcons.mail,
                      size: 22,
                      color: Colors.grey,
                    ),
                    controller: _emailController,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  PasswordTextFeild(
                    controller: _passwordController,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.normal),
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => const LoginPage());
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    child: const Text(
                      "R E G I S T E R",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
