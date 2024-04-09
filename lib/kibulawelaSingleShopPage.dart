import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:street_food/addFoodItemsKibulawala.dart';
import 'package:street_food/addReviewsKibulawala.dart';

class KibulawelaSinglePage extends StatefulWidget {
  final Map<String, dynamic> kibulawelaData;
  const KibulawelaSinglePage({Key? key, required this.kibulawelaData, }) : super(key: key);

  @override
  State<KibulawelaSinglePage> createState() => _KibulawelaSinglePageState();
}

class _KibulawelaSinglePageState extends State<KibulawelaSinglePage> {
  List<DocumentSnapshot> foodItems = [];
  
  Future<void> getFoodItems() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Kibulawala Food Items')
          .where('Registration No', isEqualTo: widget.kibulawelaData['Registration No'])
          .get();
      setState(() {
        foodItems = querySnapshot.docs;
      });
    } catch (e) {
      print('Error fetching vaccinations: $e');
    }
  }

  

  @override
  void initState() {
    super.initState();
    getFoodItems();
  }
  @override
  Widget build(BuildContext context) {
    final kibulawelaData = widget.kibulawelaData;

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
                  _buildDetailItem('Bording Name', kibulawelaData['ShopName']),
                  _buildDetailItem('address', kibulawelaData['Eddress']),
                  _buildDetailItem('contactNo', kibulawelaData['ContactNo']),
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
                  ListView.builder(
                  shrinkWrap: true,
                  itemCount: foodItems.length,
                  itemBuilder: (context, index) {
                    final foodItemsData = foodItems[index].data() as Map<String, dynamic>;
                    final foodName = foodItemsData['Food Item Name'];
                    final foodPrices = foodItemsData['Food Prices'];
                    final foodIngredients = foodItemsData['Food Ingredients'];
                    return ListTile(
                      title: Text(
                        'Food Name: $foodName',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Food Prices: $foodPrices\nFood Ingredients: $foodIngredients', 
                      ),
                    );
                  },
                ),
                ],
              ),
            ),
            const SizedBox(height: 40,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddFoodItemsKibulawala(
                      kibulawelaData: kibulawelaData,
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
            const SizedBox(height: 30,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddReviewsKibulawala(
                      kibulawelaData: kibulawelaData,
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
                'Add Reviews And Ratings',
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