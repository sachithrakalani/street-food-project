import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:street_food/const.dart';
import 'package:street_food/galleFortSingleShopPage.dart';


class GalleFortProfilePage extends StatefulWidget {
  @override
  State<GalleFortProfilePage> createState() => _GalleFortProfilePageState();
}

class _GalleFortProfilePageState extends State<GalleFortProfilePage> {
  List<DocumentSnapshot> gallefort = [];
  bool isLoading = true; 

  Future<void> getgallefortId() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('Galle Fort').get();
      setState(() {
        gallefort = querySnapshot.docs;
        isLoading = false; 
      });
    } catch (e) {
      print('Error fetching doctors: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    getgallefortId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBgcolor,
        title: const Text("Galle Fort Profiles"),
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
          padding: const EdgeInsets.all(20.0),
          child: isLoading ? const Center(
              child: CircularProgressIndicator()
            ) 
            : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: gallefort.length,
                    itemBuilder: (context, index) {
                      final gallefortData = gallefort[index].data() as Map<String, dynamic>;
                      final ShopName = gallefortData['ShopName'];
                      final Address = gallefortData['Eddress'];
                      final ContactNo = gallefortData['ContactNo'];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GalleFortSinglePage(
                                  galleFortData: gallefortData,
                                ),
                              ),
                            );
                          },
                          child: Card(
                            color: kbcardColor,
                            child: ListTile(
                              leading: const CircleAvatar(
                                maxRadius: 40,
                                backgroundImage:
                                    AssetImage('assets/images/doctor.jpeg'),
                              ),
                              title:Text(
                                'Shop Name: $ShopName',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),
                              subtitle: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'Address: $Address',
                                      style: const TextStyle(fontSize: 20)),
                                  Text(
                                      'Contact No: $ContactNo',
                                      style: const TextStyle(fontSize: 15)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}