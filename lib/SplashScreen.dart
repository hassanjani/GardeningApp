import 'dart:async';
import 'package:flutter/material.dart';
import 'package:puchong/Homepage.dart';
import 'package:puchong/Test.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

   initialize();
   }
initialize() async {
    bool check= await FirstTime();
  if(check){
    Timer(
        Duration(seconds: 3),
            () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage())));
  }else{
    Timer(
        Duration(seconds: 3),
            () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Homepage())));
  }

}



  Future<bool> FirstTime() async {
    SharedPreferences SharedPref = await SharedPreferences.getInstance();

    var isFirstTime = SharedPref.getBool('first_time');
    if (isFirstTime != null && !isFirstTime) {
      SharedPref.setBool('first_time', false);
      print("not first");
      return false;
    } else {
      SharedPref.setBool('first_time', false);
      print("Firstrun");
      return true;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //       colors: [
        //         const Color(0xFF00a3cc),
        //         const Color(0xFF33d6ff),
        //         const Color(0xFF66e0ff),
        //       ],
        //       begin: const FractionalOffset(0.0, 0.0),
        //       end: const FractionalOffset(1.0, 0.0),
        //       // stops: [0.0, 1.0],
        //       tileMode: TileMode.clamp),
        // ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image.asset('assets/logo.png')),
              SizedBox(
                height: 20,
              ),
              Text(
                "MY \n GARDENER",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              )
            ],
          ),
        ),
      ),
    );
  }
}
