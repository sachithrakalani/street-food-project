import 'package:flutter/material.dart';
import 'package:street_food/aluthkadeProfilePage.dart';
import 'package:street_food/galleFortProfilePage.dart';
import 'package:street_food/kibulawelaProfilePage.dart';
import 'package:street_food/shopDetailspage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Where to go?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                TextButton(
                  onPressed:(){
                    
                  }, 
                  child: const Text(
                    'See All >',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black
                    ),
                  )
                )
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, 
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AluthkadeProfilePage(
                            
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/images/ho2.jpg',
                      width: 150,
                      height: 150,
                    ),
                  ),
                  const SizedBox(width: 10,),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => KibulawelaProfilePage(
                            
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/images/ho3.jpg',
                      width: 150,
                      height: 150,
                    ),
                  ),
                  const SizedBox(width: 10,),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GalleFortProfilePage(
                            
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/images/ho3.jpg',
                      width: 150,
                      height: 150,
                    ),
                  ),
                ],
              ),
            ),
            
            //const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Food Category',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                TextButton(
                  onPressed:(){
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context)=>HomePage())
                    // );
                  }, 
                  child: const Text(
                    'See All >',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black
                    ),
                  )
                )
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, // Adjust alignment as needed
                children: [
                  InkWell(
                    onTap: () {
                      
                  
                    },
                    child: Image.asset(
                      'assets/images/ho2.jpg',
                      width: 150,
                      height: 150,
                    ),
                  ),
                  const SizedBox(width: 10,),
                  InkWell(
                    onTap: () {
                      
                    },
                    child: Image.asset(
                      'assets/images/ho3.jpg',
                      width: 150,
                      height: 150,
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
