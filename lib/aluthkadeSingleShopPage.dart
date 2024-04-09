import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:street_food/addFoodItemsAluthkade.dart';
import 'package:street_food/addReviewsAluthkade.dart';
class AluthkadeSinglePage extends StatefulWidget {
  final Map<String, dynamic> aluthkadeData;
  const AluthkadeSinglePage({Key? key, required this.aluthkadeData}) : super(key: key);

  @override
  State<AluthkadeSinglePage> createState() => _AluthkadeSinglePageState();
}

class _AluthkadeSinglePageState extends State<AluthkadeSinglePage> {
  List<DocumentSnapshot> foodItems = [];

  Future<void> getFoodItems() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Aluthkade Food Items')
          .where('Registration No', isEqualTo: widget.aluthkadeData['Registration No'])
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
    final aluthkadeData = widget.aluthkadeData;

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
                  _buildDetailItem('Bording Name', aluthkadeData['ShopName']),
                  _buildDetailItem('address', aluthkadeData['Eddress']),
                  _buildDetailItem('contactNo', aluthkadeData['ContactNo']),
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      'Food Items',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
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
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      'Reviews And Ratings',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddFoodItemsAluthkade(
                    aluthkadeData: aluthkadeData,
                  ),
                ),
              );
            },
            heroTag: 'addFoodItems',
            backgroundColor: Colors.orange,
            child: Icon(Icons.add),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddReviewsAluthkade(
                    aluthkadeData: aluthkadeData,
                  ),
                ),
              );
            },
            heroTag: 'addReviews',
            backgroundColor: Colors.orange,
            child: Icon(Icons.rate_review),
          ),
        ],
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
