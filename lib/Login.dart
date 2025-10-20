import 'package:ecommerece_app/forgotPass.dart';
import 'package:ecommerece_app/product_screen.dart';
import 'package:ecommerece_app/signup.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isPassVisiable = true;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true, // Ensures keyboard doesn't cause overflow
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: screenHeight * 0.15,
                width: screenWidth * 0.3,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/login.png"),
                  fit: BoxFit.fill,
                )),
              ),
              const SizedBox(
                height: 30,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Back",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                  )
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Log in to your account using email",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  )
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "or social network",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: screenHeight * 0.06,
                width: screenWidth * 0.9,
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.mail,
                        color: Colors.grey,
                      ),
                      border: InputBorder.none,
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: screenHeight * 0.06,
                width: screenWidth * 0.9,
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextFormField(
                  obscureText: isPassVisiable,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPassVisiable
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          isPassVisiable = !isPassVisiable;
                        });
                      },
                    ),
                    border: InputBorder.none,
                    hintText: "Password",
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 210),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Forgotpass()));
                    },
                    child: const Text(
                      "Forgot Password",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 98, 158, 130)),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProductScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 98, 158, 130),
                      fixedSize: Size(screenWidth * 0.9, screenHeight * 0.07)),
                  child: const Center(
                    child: Text("Login",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  )),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      indent: 20,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Or login with",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      endIndent: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    //code for Login with google.
                  },
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    fixedSize: Size(screenWidth * 0.9, screenHeight * 0.07),
                  ),
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 65),
                        child: Icon(
                          FontAwesomeIcons.google,
                          color: Colors.lightBlue,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Login with Google",
                          style: TextStyle(fontSize: 17),
                        ),
                      )
                    ],
                  )),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    //code for Login with facebook.
                  },
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    fixedSize: Size(screenWidth * 0.9, screenHeight * 0.07),
                  ),
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 65),
                        child: Icon(
                          FontAwesomeIcons.facebook,
                          color: Colors.lightBlue,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Login with Facebok",
                          style: TextStyle(fontSize: 17),
                        ),
                      )
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 110),
                    child: Text(
                      "First time here?",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Signup()));
                      },
                      child: const Text(
                        "signup",
                        style: TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 98, 158, 130)),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
