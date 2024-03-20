import 'package:flutter/material.dart';
import 'package:street_food/const.dart';
import 'package:street_food/homePage.dart';
import 'package:street_food/signUpPage.dart';

class GetStartPage extends StatefulWidget {
  const GetStartPage({super.key});

  @override
  State<GetStartPage> createState() => _GetStartPageState();
}

class _GetStartPageState extends State<GetStartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        color: kbBodyBgColor,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Street Food Flavors",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                ),
                const Text(
                  'Sri Lanka',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                ),
                Image.asset(
                'assets/images/streetFoodCart.png',
                fit: BoxFit.cover,
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed:(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage ())
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(200, 70),
                    primary: Colors.orange[400],
                    onPrimary: Colors.black,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ), 
                  child: const Text(
                    'GET START',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black
                    ),
                  )
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}