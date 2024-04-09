import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:street_food/const.dart';
import 'package:street_food/toast.dart';

class ShopDetailsPage extends StatefulWidget {
  const ShopDetailsPage({super.key});

  @override
  State<ShopDetailsPage> createState() => _ShopDetailsPageState();
}

class _ShopDetailsPageState extends State<ShopDetailsPage> {
  TextEditingController shopNameController = TextEditingController();
  TextEditingController registrationNoController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController contactNoController = TextEditingController();

  
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
        backgroundColor: kbappbarcolor,
        title: const Text(
          'Shops Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25
          ),
        ),
        centerTitle: true,
      ),
      body:SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                SingleChildScrollView(),
                Column(
                  children: [
                  const Center(
                    child: Text(
                      'Shop Details',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40,),
                  Column(
                    children: [
                      SizedBox(height: 60,
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
                        const SizedBox(height: 50,),
                        Row(
                          children: [
                            const Text(
                              'Shop Name',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 25,
                              ),
                            ),
                            const SizedBox(width: 30),
                            Expanded(
                              child: SizedBox(
                                height: 60,
                                child: TextField(
                                  controller: shopNameController,
                                  decoration: InputDecoration(
                                    labelText: 'Enter Shop Name',
                                    border: OutlineInputBorder(
                                    borderRadius:BorderRadius.circular(30)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            const Text(
                              'Registration',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 25,
                              ),
                            ),
                            const SizedBox(width: 30),
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
                            const SizedBox(width: 70),
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
                            const SizedBox(width: 40),
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
                        const SizedBox(height: 60),
                          GestureDetector(
                          onTap: () {
                            save();
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: kbappbarcolor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                'Save',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      )
    );
  }

  void save() async {
    if(shopLocations != null){
      Map<String, dynamic> data = {
        "ShopName":shopNameController.text,
        "Eddress": addressController.text,
        "ContactNo": contactNoController.text,
        "RegistrationNo": registrationNoController.text,
      };
      FirebaseFirestore.instance.collection(shopLocations!).add(data);
      Navigator.pushNamed(context, "/home");
    } else {
      showToast(message: "Some error happend");
    }
  }
}