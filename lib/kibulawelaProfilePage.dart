import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:street_food/kibulawelaSingleShopPage.dart';


class KibulawelaProfilePage extends StatefulWidget {
  @override
  State<KibulawelaProfilePage> createState() => _KibulawelaProfilePageState();
}

class _KibulawelaProfilePageState extends State<KibulawelaProfilePage> {
  List<DocumentSnapshot> kibulawela = [];
  bool isLoading = true; 

  Future<void> getDocId() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('Kibulawela').get();
      setState(() {
        kibulawela = querySnapshot.docs;
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
        //backgroundColor: kBgcolor,
        title: Text("Kibulawela Profiles"),
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
          child: isLoading ? const Center(
              child: CircularProgressIndicator()
            ) // Show loading indicator
            : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: kibulawela.length,
                    itemBuilder: (context, index) {
                      final kibulawelaData = kibulawela[index].data() as Map<String, dynamic>;
                      final ShopName = kibulawelaData['ShopName'];
                      final Address = kibulawelaData['Eddress'];
                      final ContactNo = kibulawelaData['ContactNo'];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => KibulawelaSinglePage(
                                  kibulawelaData: kibulawelaData,
                                ),
                              ),
                            );
                          },
                          child: Card(
                            //color: kbcardColor,
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