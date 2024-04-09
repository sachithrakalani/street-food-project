import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:street_food/const.dart';
import 'package:street_food/kibulawelaSingleShopPage.dart';


class KibulawelaProfilePage extends StatefulWidget {
  @override
  State<KibulawelaProfilePage> createState() => _KibulawelaProfilePageState();
}

class _KibulawelaProfilePageState extends State<KibulawelaProfilePage> {
  List<DocumentSnapshot> kibulawala = [];
  bool isLoading = true; 

  Future<void> getDocId() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('Kibulawela').get();
      setState(() {
        kibulawala = querySnapshot.docs;
        isLoading = false; 
      });
    } catch (e) {
      print('Error fetching doctors: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    getDocId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBgcolor,
        title: Text("Kibulawela Profiles"),
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
            ) // Show loading indicator
            : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: kibulawala.length,
                    itemBuilder: (context, index) {
                      final kibulawalaData = kibulawala[index].data() as Map<String, dynamic>;
                      final ShopName = kibulawalaData['ShopName'];
                      final Address = kibulawalaData['Address'];
                      final ContactNo = kibulawalaData['ContactNo'];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => KibulawalaSinglePage(
                                  kibulawalaData: kibulawalaData,
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
                                    AssetImage('assets/images/back10.jpeg'),
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