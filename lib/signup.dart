import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isPassVisiable = true;
  bool isConfirmPassVisiable = true;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Create New Account",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
                  )
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Looks like you don't have an account",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  )
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "or connect with social network",
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
                        FontAwesomeIcons.user,
                        color: Colors.grey,
                      ),
                      border: InputBorder.none,
                      hintText: "Name",
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
              const SizedBox(
                height: 10,
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
                height: 10,
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
                        FontAwesomeIcons.phone,
                        color: Colors.grey,
                      ),
                      border: InputBorder.none,
                      hintText: "Phone Number",
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
              const SizedBox(
                height: 10,
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
              const SizedBox(
                height: 10,
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
                  obscureText: isConfirmPassVisiable,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isConfirmPassVisiable
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          isConfirmPassVisiable = !isConfirmPassVisiable;
                        });
                      },
                    ),
                    border: InputBorder.none,
                    hintText: "Confirm Password",
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    //code for login page here.
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 98, 158, 130),
                      fixedSize: Size(screenWidth * 0.9, screenHeight * 0.07)),
                  child: const Center(
                    child: Text("Signup",
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
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 65),
                    child: Text(
                      "Already have an account?",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 98, 158, 130)),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
