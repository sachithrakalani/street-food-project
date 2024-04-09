import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:street_food/const.dart';
import 'package:street_food/toast.dart';

class AddReviewsGalleFort extends StatefulWidget {
  final Map<String, dynamic> galleFortData;
  const AddReviewsGalleFort({Key? key, required this.galleFortData}) : super(key: key);

  @override
  State<AddReviewsGalleFort> createState() => _AddReviewsGalleFortState();
}

class _AddReviewsGalleFortState extends State<AddReviewsGalleFort> {
  TextEditingController reviewNameController = TextEditingController();
  double rating = 3.0;
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final String shopName = widget.galleFortData['ShopName'] ?? '';
    final String RegistrationNo = widget.galleFortData['RegistrationNo'] ?? '';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBgcolor,
        title: const Text(
          'Add Reviews',
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
            image: AssetImage('assets/images/back2.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 40),
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
                const SizedBox(height: 20),
                TextField(
                  controller: reviewNameController,
                  decoration: const InputDecoration(
                    hintText: 'Write the review',
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => _selectDate(context),
                        child: InputDecorator(
                          decoration: const InputDecoration(
                            hintText: 'Select Date',
                            labelText: 'Date',
                            border: OutlineInputBorder(),
                          ),
                          child: Text(selectedDate != null
                              ? '${selectedDate!.toLocal()}'.split(' ')[0]
                              : 'Select Date'),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                RatingBar.builder(
                  initialRating: rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (newRating) {
                    setState(() {
                      rating = newRating;
                    });
                  },
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () async {
                    if (reviewNameController.text.isEmpty ||
                        selectedDate == null ||
                        rating == 0) {
                          showToast(message: "All fields are required.");
                    } else {
                      try {
                        Map<String, dynamic> data = {
                          "Shop Name": shopName,
                          "Registration No": RegistrationNo,
                          "Review": reviewNameController.text,
                          "Rating": rating,
                          "Date": '${selectedDate!.toLocal()}'.split(' ')[0],
                        };
                        await FirebaseFirestore.instance
                            .collection('Galle Fort Reviews')
                            .add(data);
                      } catch (e) {
                        print("Error adding review: $e");
                      }
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
