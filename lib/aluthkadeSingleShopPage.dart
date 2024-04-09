import 'package:flutter/material.dart';
import 'package:street_food/addFoodItemsAluthkade.dart';
import 'package:street_food/const.dart';

class AluthkadeSinglepage extends StatefulWidget {
  final Map<String, dynamic> aluthkadeData;
  const AluthkadeSinglepage({Key? key, required this.aluthkadeData})
      : super(key: key);

  @override
  State<AluthkadeSinglepage> createState() => _AluthkadeSinglepageState();
}

class _AluthkadeSinglepageState extends State<AluthkadeSinglepage> {
  

  

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final aluthkadeData = widget.aluthkadeData;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBgcolor,
        title: Text('Shop Details Page'),
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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    const CircleAvatar(
                      radius: 130, 
                      backgroundImage: AssetImage('assets/images/doctor.jpeg'),
                    ),
                    _buildDetailItem('Shop Name', aluthkadeData['ShopName']),
                    _buildDetailItem('Address', aluthkadeData['Eddress']),
                    _buildDetailItem('contact No', aluthkadeData['ContactNo']),
                    const SizedBox(height: 20),
                    const Center(
                      child: Text(
                        'Food Items',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddFoodItemsAluthkade(
                        aluthkadeData: aluthkadeData,
                      )
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.orange,
                  fixedSize: const Size(100, 60),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
                child: const Text(
                  'Add Food Items',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailItem(String title, String value) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title + ':',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              value,
              style: const TextStyle(
                fontSize: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}