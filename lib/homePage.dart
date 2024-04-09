import 'package:flutter/material.dart';
import 'package:street_food/aluthkadeProfilePage.dart';
import 'package:street_food/galleFortProfilePage.dart';
import 'package:street_food/kibulawelaProfilePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(38.0),
          child: Column(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Where To Go ?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    ),
                    const SizedBox(height: 30,),
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
                      child: Image.asset('assets/images/ho2.jpg'),
                    ),
                    const SizedBox(height: 10,),
                    const Text(
                      'ALUTHKADE',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ) ,
                    const SizedBox(height: 30,),
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
                      child: Image.asset('assets/images/ho1.webp',),
                    ),
                    const SizedBox(height: 10,),
                    const Text(
                      'KIBULAWALA',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(height: 30,),
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
                      child: Image.asset('assets/images/ho3.jpg'),
                    ),
                    const SizedBox(height: 10,),
                    const Text(
                      'Galle Fort',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    )   
                  ],
                ),
              ) 
            ],
          ),
        ),
      )
    );
  }
}
