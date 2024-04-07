import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class AluthkadeProfilePage extends StatefulWidget {
  @override
  State<AluthkadeProfilePage> createState() => _AluthkadeProfilePageState();
}

class _AluthkadeProfilePageState extends State<AluthkadeProfilePage> {
  List<DocumentSnapshot> aluthkade = [];
  bool isLoading = true; 

  Future<void> getDocId() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('Aluthkade').get();
      setState(() {
        aluthkade = querySnapshot.docs;
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
        title: Text("Aluthkade Profiles"),
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
                    itemCount: aluthkade.length,
                    itemBuilder: (context, index) {
                      final aluthkadeData = aluthkade[index].data() as Map<String, dynamic>;
                      final ShopName = aluthkadeData['ShopName'];
                      final Address = aluthkadeData['Eddress'];
                      final ContactNo = aluthkadeData['ContactNo'];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => SingleDoctorPage(
                            //       doctorData: doctorData,
                            //     ),
                            //   ),
                            // );
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