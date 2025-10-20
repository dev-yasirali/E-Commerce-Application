import 'package:flutter/material.dart';

class Forgotpass extends StatefulWidget {
  const Forgotpass({super.key});

  @override
  State<Forgotpass> createState() => _ForgotpassState();
}

class _ForgotpassState extends State<Forgotpass> {
  String selectedOption = 'SMS';
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/forgotPass.png"),
                    fit: BoxFit.contain)),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: screenHeight * 0.1,
                    left: screenWidth * 0.05,
                    right: screenWidth * 0.05),
                child: const Text(
                  "Forgot Password",
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.w900),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Select which contact details should we use to",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "reset your passworrd.",
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
              SizedBox(height: screenHeight * 0.51),
              GestureDetector(
                onTap: () => {
                  setState(() {
                    selectedOption = 'SMS';
                  })
                },
                child: Container(
                  width: 350,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: selectedOption == 'SMS'
                          ? Colors.blue.shade50
                          : Colors.white,
                      border: Border.all(
                        color: selectedOption == 'SMS'
                            ? Colors.blue
                            : Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.sms,
                        color: Colors.blue,
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      const Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Send OTP via SMS",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87),
                          ),
                          Text(
                            "(209) 555-0104",
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          )
                        ],
                      )),
                      if (selectedOption == 'SMS')
                        const Icon(
                          Icons.check_circle,
                          color: Colors.blue,
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              GestureDetector(
                onTap: () => {
                  setState(() {
                    selectedOption = 'Email';
                  })
                },
                child: Container(
                  width: 350,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: selectedOption == 'Email'
                          ? Colors.blue.shade50
                          : Colors.white,
                      border: Border.all(
                        color: selectedOption == 'Email'
                            ? Colors.blue
                            : Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.mail,
                        color: Colors.blue,
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      const Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Send OTP via Email",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87),
                          ),
                          Text(
                            "diridstudio@example.com",
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          )
                        ],
                      )),
                      if (selectedOption == 'Email')
                        const Icon(
                          Icons.check_circle,
                          color: Colors.blue,
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      //code for continue button
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.35,
                            vertical: screenHeight * 0.018),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18))),
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
