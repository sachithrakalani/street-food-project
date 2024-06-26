import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:street_food/const.dart';
import 'package:street_food/toast.dart';

class AddFoodItemsKibulawala extends StatefulWidget {
  final Map<String, dynamic> kibulawalaData;
  const AddFoodItemsKibulawala({Key? key, required this.kibulawalaData}) : super(key: key);

  @override
  State<AddFoodItemsKibulawala> createState() => _AddFoodItemsKibulawalaState();
}

class _AddFoodItemsKibulawalaState extends State<AddFoodItemsKibulawala> {
  
  TextEditingController foodNameController = TextEditingController();
  TextEditingController ingredientsController = TextEditingController();
  TextEditingController pricesContriller = TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    final String shopName = widget.kibulawalaData['ShopName'] ?? '';
    final String RegistrationNo = widget.kibulawalaData['RegistrationNo'] ?? '';
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBgcolor,
        title: const Text(
          'Add Food Item',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/paw.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 40),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Shop Name: $shopName',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Registration No: $RegistrationNo',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 60),
                TextField(
                  controller: foodNameController,
                  decoration: const InputDecoration(
                    hintText: 'Food Item Name',
                  ),
                ),
                const SizedBox(height: 40),
                TextField(
                  controller: ingredientsController,
                  decoration: const InputDecoration(
                    hintText: 'Food Ingredients',
                  ),
                ),
                const SizedBox(height: 40),
                TextField(
                  controller: pricesContriller,
                  decoration: const InputDecoration(
                    hintText: 'Food Prices',
                  ),
                ),
                const SizedBox(height: 60),
                ElevatedButton(
                  onPressed: () {
                    if (foodNameController.text.isEmpty || pricesContriller.text.isEmpty) {
                      showToast(message: "Food Item name and Prices are required.");
                    } else {
                      Map<String, dynamic> data = {
                          "Shop Name": shopName,
                          "Registration No":RegistrationNo,
                          "Food Item Name": foodNameController.text,
                          "Food Ingredients": ingredientsController.text,
                          "Food Prices": pricesContriller.text,
                        };
                        FirebaseFirestore.instance.collection('Kibulawala Food Items').add(data);
                        Navigator.pushNamed(context, "/home");
                      }
                    },
                    style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(kbAppbarcolors), 
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black), 
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 40), 
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0), 
                      ),
                    ),
                  ),
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}