import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:street_food/addFoodItemsAluthkade.dart';
import 'package:street_food/addReviewsAluthkade.dart';
import 'package:street_food/const.dart';
class AluthkadeSinglePage extends StatefulWidget {
  final Map<String, dynamic> aluthkadeData;
  const AluthkadeSinglePage({Key? key, required this.aluthkadeData}) : super(key: key);

  @override
  State<AluthkadeSinglePage> createState() => _AluthkadeSinglePageState();
}

class _AluthkadeSinglePageState extends State<AluthkadeSinglePage> {
  late SharedPreferences prefs;
  List<DocumentSnapshot> foodItems = [];
  List<DocumentSnapshot> aluthkadeReviews = [];
  bool isEnableAddFoodButton = false; 

  

  void initializeSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    final String? loginUserEmail = prefs.getString('email');
    print('Login user EMAIL $loginUserEmail');
    print(widget.aluthkadeData['Email']);
    if(loginUserEmail == widget.aluthkadeData['Email']){
      isEnableAddFoodButton = true;
    }
    print('Enable $isEnableAddFoodButton');
  }

  Future<void> getFoodItems() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Aluthkade Food Items')
          .where('Registration No', isEqualTo: widget.aluthkadeData['RegistrationNo'])
          .get();
      setState(() {
        foodItems = querySnapshot.docs;
      });
    } catch (e) {
      print('Error fetching vaccinations: $e');
    }
  }
  Future<void> getreviews() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Aluthkade Reviews')
          .where('Registration No', isEqualTo: widget.aluthkadeData['RegistrationNo'])
          .get();
      setState(() {
       aluthkadeReviews = querySnapshot.docs;
      });
    } catch (e) {
      print('Error fetching vaccinations: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    getFoodItems();
    getreviews();
    initializeSharedPreferences();
  }

 

  @override
  Widget build(BuildContext context) {
    final aluthkadeData = widget.aluthkadeData;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBgcolor,
        title: Text('Aluthkade Street Shop Details'),
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
                    backgroundImage: AssetImage('assets/images/back10.jpeg'),
                  ),
                  _buildDetailItem('Shop Name', aluthkadeData['ShopName']),
                  _buildDetailItem('Address', aluthkadeData['Address']),
                  _buildDetailItem('Contact No', aluthkadeData['ContactNo']),
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
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: aluthkadeReviews.length,
                      itemBuilder: (context, index) {
                        final reviewsData = aluthkadeReviews[index].data() as Map<String, dynamic>;
                        final userreview = reviewsData['Review'];
                        final userrating = reviewsData['Rating'];
                        final date = reviewsData['Date'];
                        
                        return ListTile(
                          title: Text(
                            'Review: $userreview',
                            style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Rating: $userrating / 5.0',
                                style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18,),
                              ),
                              Text(
                                'Date: $date',
                                style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18,),
                              ),
                            ],
                          ),
                        );
                      },
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
          if(isEnableAddFoodButton == true)
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
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 16),
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
            child: const Icon(Icons.rate_review),
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
