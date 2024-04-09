import 'package:flutter/material.dart';
import 'package:street_food/addFoodItemsAluthkade.dart';
import 'package:street_food/addFoodItemsGalleFort.dart';

class GalleFortSinglePage extends StatefulWidget {
  final Map<String, dynamic> galleFortData;
  const GalleFortSinglePage({Key? key, required this.galleFortData, }) : super(key: key);

  @override
  State<GalleFortSinglePage> createState() => _GalleFortSinglePageState();
}

class _GalleFortSinglePageState extends State<GalleFortSinglePage> {
  

  

  @override
  void initState() {
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    final galleFortData = widget.galleFortData;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('Shop Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                children: [
                  const CircleAvatar(
                    radius: 130, 
                    backgroundImage: AssetImage('assets/images/pethouse.jpeg'),
                  ),
                  _buildDetailItem('Bording Name', galleFortData['ShopName']),
                  _buildDetailItem('address', galleFortData['Eddress']),
                  _buildDetailItem('contactNo', galleFortData['ContactNo']),
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      'Food Items',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                      ),
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
                      MaterialPageRoute(builder: (context) => AddFoodItemsGalleFort(
                        galleFortData: galleFortData,
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