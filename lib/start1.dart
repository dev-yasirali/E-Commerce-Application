import 'package:ecommerece_app/Login.dart';
import 'package:ecommerece_app/start2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Start1 extends StatefulWidget {
  const Start1({super.key});

  @override
  State<Start1> createState() => _Start1State();
}

class _Start1State extends State<Start1> {
  
  @override
  Widget build(BuildContext context) {
  double screenWidth=MediaQuery.of(context).size.width;
  double screenHeight=MediaQuery.of(context).size.height;
    
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 241, 237),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/start1.png"),
              fit: BoxFit.contain)
            ),
          ),
          Positioned(
            top: screenHeight*0.04,
            right: screenWidth*0.17,
            child: const Text("Skip",style: TextStyle(color: Color.fromARGB(255, 98, 158, 130)),)),
          Align(alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: CircleAvatar(backgroundColor:const Color.fromARGB(255, 98, 158, 130),radius: 19,child:  IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:(context)=>const Login()));
            }, icon: const Icon(FontAwesomeIcons.arrowRight,color: Colors.white,)))),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenHeight*0.65,left: screenWidth*0.07,right: screenWidth*0.07),
            child: ClipRRect(
              borderRadius:BorderRadius.circular(20),
              child: Container(
                height: screenHeight*0.3,
                width:  screenWidth*0.9,
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(height: screenHeight*0.02),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Find the best",style:TextStyle(fontWeight:FontWeight.w900,fontSize: 23),),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("fashion style ",style: TextStyle(fontSize: 23,fontWeight: FontWeight.w900,color: Color.fromARGB(255, 147, 216, 184)),),
                        Text("for you",style: TextStyle(fontSize: 23,fontWeight: FontWeight.w900),)
                      ],
                    ),
                    SizedBox(height: screenHeight*0.01,),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Get exclusive limited apparel that only",style: TextStyle(fontSize: 17),)
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("you have! Made by famous brands.",style: TextStyle(fontSize: 17),)
                      ],
                    ),
                    SizedBox(height:screenHeight*0.025,),
                    ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>const Start2()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 98, 158, 130),
                        fixedSize: Size(screenWidth*0.8, screenHeight*0.07)
                      ), 
                      child: const Center(
                        child: Text("Next",style: TextStyle(color: Colors.white,fontSize: 20)),))
                  ],
                ),
              ),
            ),
          )
        ] ,
      ),
    );
  }
}