import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:street_food/addFoodItemsKibulawala.dart';
import 'package:street_food/addReviewsKibulawala.dart';
import 'package:street_food/const.dart';

class KibulawalaSinglePage extends StatefulWidget {
  final Map<String, dynamic> kibulawalaData;
  const KibulawalaSinglePage({Key? key, required this.kibulawalaData}) : super(key: key);

  @override
  State<KibulawalaSinglePage> createState() => _KibulawalaSinglePageState();
}

class _KibulawalaSinglePageState extends State<KibulawalaSinglePage> {
  late SharedPreferences prefs;
  List<DocumentSnapshot> foodItems = [];
  List<DocumentSnapshot> kibulawalaReviews = [];
  bool isEnableAddFoodButton = false; 

  
  void initializeSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    final String? loginUserEmail = prefs.getString('email');
    print('Login user EMAIL $loginUserEmail');
    print(widget.kibulawalaData['Email']);
    if(loginUserEmail == widget.kibulawalaData['Email']){
      isEnableAddFoodButton = true;
    }
    print('Enable $isEnableAddFoodButton');
  }
  
  Future<void> getFoodItems() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Kibulawala Food Items')
          .where('Registration No', isEqualTo: widget.kibulawalaData['RegistrationNo'])
          .get();
      setState(() {
        foodItems = querySnapshot.docs;
      });
    } catch (e) {
      print('Error fetching Food Items: $e');
    }
  }
  Future<void> getreviews() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Kibulawala Reviews')
          .where('Registration No', isEqualTo: widget.kibulawalaData['RegistrationNo'])
          .get();
      setState(() {
       kibulawalaReviews = querySnapshot.docs;
      });
    } catch (e) {
      print('Error fetching Reviews : $e');
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
    final kibulawalaData = widget.kibulawalaData;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBgcolor,
        title: Text('Kibulawala Street Shop Details'),
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
                  _buildDetailItem('Shop Name', kibulawalaData['ShopName']),
                  _buildDetailItem('Address', kibulawalaData['Address']),
                  _buildDetailItem('Contact No', kibulawalaData['ContactNo']),
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
                      itemCount: kibulawalaReviews.length,
                      itemBuilder: (context, index) {
                        final reviewsData = kibulawalaReviews[index].data() as Map<String, dynamic>;
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
                  builder: (context) => AddFoodItemsKibulawala(
                    kibulawalaData: kibulawalaData,
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
                  builder: (context) => AddReviewsKibulawala(
                    kibulawalaData: kibulawalaData,
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
