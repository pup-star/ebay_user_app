import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/controller/login_controller.dart';
import 'package:shopping/models/login_model.dart';
import 'package:shopping/views/login/widget/email_widget.dart';
import 'package:shopping/views/login/widget/password_widget.dart';
import 'package:shopping/views/register/resgister_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();

  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Center(child: Text("")),
      ),
      body: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 180,
            ),
            const Center(
                child: Text(
              "L O G I N",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            )),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  EmailTextFeild(
                    hintText: "Enter Email",
                    prefixIcon: const Icon(
                      Icons.mail,
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
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Get.to(() => RegistrationPage());
                            },
                            child: const Text("Register")),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    // onPressed: () {
                    //   Get.to(() => const HomePage());
                    // },
                    onPressed: () {
                      if (_emailController.text.isNotEmpty &&
                          _passwordController.text.length >= 8) {
                        LoginModel model = LoginModel(
                            email: _emailController.text,
                            password: _passwordController.text);

                        String data = loginModelToJson(model);

                        controller.loginFunction(data);
                      }
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    child: const Text(
                      'L o g I n ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
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
