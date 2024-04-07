import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:street_food/firebaseAuth.dart';
import 'package:street_food/logInPage.dart';
import 'package:street_food/toast.dart';

class SignUpPage extends StatefulWidget {

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseAuthServices _auth = FirebaseAuthServices();

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController shopNameController = new TextEditingController();
  TextEditingController registrationNoController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController contactNoController = new TextEditingController();
  
  

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? shopLocations;
  var locations = [
    'Aluthkade',
    'Kibulawela',
    'Galle Fort',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:const Text(
          'Sign Up',style: TextStyle(
            fontWeight:FontWeight.bold,
            fontSize: 25 
          ),
        ),
        centerTitle: true,
      ),
      body:SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 25,fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          labelText: 'Enter Username',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Enter your Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Enter your Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                      height: 60,
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Select Shop Location',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            value: shopLocations,
                            items: locations.map((String item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                shopLocations = newValue!;
                              });
                            },
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    if (shopLocations == 'Aluthkade')
                      Column(
                        children: [
                          const Text(
                            'Shop Details',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'Shop Name',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 25,
                                    ),
                                  ),
                                  const SizedBox(width: 60),
                                  Expanded(
                                    child: SizedBox(
                                      height: 60,
                                      child: TextField(
                                        controller: shopNameController,
                                        decoration: InputDecoration(
                                          labelText: 'Enter Shop Name',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              const Text(
                                'Registration No',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 25,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: SizedBox(
                                  height: 60,
                                  child: TextField(
                                    controller: registrationNoController,
                                    decoration: InputDecoration(
                                      labelText: 'Enter Registration No',
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              const Text(
                                'Address',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 25,
                                ),
                              ),
                              const SizedBox(width: 50),
                              Expanded(
                                child: SizedBox(
                                  height: 60,
                                  child: TextField(
                                    controller: addressController,
                                    decoration: InputDecoration(
                                      labelText: 'Enter address',
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              const Text(
                                'Contact No',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 25,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: SizedBox(
                                  height: 60,
                                  child: TextField(
                                    controller: contactNoController,
                                    decoration: InputDecoration(
                                      labelText: 'Enter your Contact No',
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                      if (shopLocations == 'Kibulawela')
                      Column(
                        children: [
                          const Text(
                            'Shop Details',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'Shop Name',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 25,
                                    ),
                                  ),
                                  const SizedBox(width: 60),
                                  Expanded(
                                    child: SizedBox(
                                      height: 60,
                                      child: TextField(
                                        controller: shopNameController,
                                        decoration: InputDecoration(
                                          labelText: 'Enter Shop Name',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              const Text(
                                'Registration No',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 25,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: SizedBox(
                                  height: 60,
                                  child: TextField(
                                    controller: registrationNoController,
                                    decoration: InputDecoration(
                                      labelText: 'Enter Registration No',
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              const Text(
                                'Address',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 25,
                                ),
                              ),
                              const SizedBox(width: 50),
                              Expanded(
                                child: SizedBox(
                                  height: 60,
                                  child: TextField(
                                    controller: addressController,
                                    decoration: InputDecoration(
                                      labelText: 'Enter address',
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              const Text(
                                'Contact No',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 25,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: SizedBox(
                                  height: 60,
                                  child: TextField(
                                    controller: contactNoController,
                                    decoration: InputDecoration(
                                      labelText: 'Enter your Contact No',
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                      if (shopLocations == 'Galle Fort')
                      Column(
                        children: [
                          const Text(
                            'Shop Details',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'Shop Name',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 25,
                                    ),
                                  ),
                                  const SizedBox(width: 60),
                                  Expanded(
                                    child: SizedBox(
                                      height: 60,
                                      child: TextField(
                                        controller: shopNameController,
                                        decoration: InputDecoration(
                                          labelText: 'Enter Shop Name',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              const Text(
                                'Registration No',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 25,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: SizedBox(
                                  height: 60,
                                  child: TextField(
                                    controller: registrationNoController,
                                    decoration: InputDecoration(
                                      labelText: 'Enter Registration No',
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              const Text(
                                'Address',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 25,
                                ),
                              ),
                              const SizedBox(width: 50),
                              Expanded(
                                child: SizedBox(
                                  height: 60,
                                  child: TextField(
                                    controller: addressController,
                                    decoration: InputDecoration(
                                      labelText: 'Enter address',
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              const Text(
                                'Contact No',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 25,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: SizedBox(
                                  height: 60,
                                  child: TextField(
                                    controller: contactNoController,
                                    decoration: InputDecoration(
                                      labelText: 'Enter your Contact No',
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    const SizedBox(height: 30),
                      GestureDetector(
                      onTap: () {
                        signUp();
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=>LogInPage())
                            );
                          },
                          child: const Text(
                            'Log in',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      )
    );
  }


  void signUp() async {
    String userName = usernameController.text;
    String email = emailController.text;
    String password = passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    if (user != null) {
      showToast(message: "User is successfully created");
    } else {
      showToast(message: "Some error happend");
    }
  }
}