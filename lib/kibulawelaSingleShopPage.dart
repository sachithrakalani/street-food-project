import 'package:flutter/material.dart';

class KibulawelaSinglePage extends StatefulWidget {
  final Map<String, dynamic> kibulawelaData;
  const KibulawelaSinglePage({Key? key, required this.kibulawelaData, }) : super(key: key);

  @override
  State<KibulawelaSinglePage> createState() => _KibulawelaSinglePageState();
}

class _KibulawelaSinglePageState extends State<KibulawelaSinglePage> {
  

  

  @override
  void initState() {
    super.initState();
    
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
                      'Reviews & Ratings',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                      ),
                    ),
                  ),
                  
                ],
                
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