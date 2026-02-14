import 'package:flutter/material.dart';

//Student Numbers:222001607,222000452,220013730,224013987,222028440,222014691
//Student Names:Machedi M,Sidamba Z,Mohlolo KI,Selebalo KD,Mbulawa AG,Mahao B
//Question 1:Welcome screen

void main() {
  runApp(const RealEstateApp());
}

class RealEstateApp extends StatelessWidget {
  const RealEstateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real Estate App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PropertyListScreen(),
    );
  }
}

// Property Model
class Property {
  final String title;
  final String location;
  final int price;
  final String imagePath;
  final String description;
  final int bedrooms;
  final int bathrooms;
  final int size;

  Property({
    required this.title,
    required this.location,
    required this.price,
    required this.imagePath,
    required this.description,
    required this.bedrooms,
    required this.bathrooms,
    required this.size,
  });
}

// Sample Data
final List<Property> properties = [
  Property(
    title: "3-Bedroom Apartment",
    location: "Cape Town, South Africa",
    imagePath: "assets/House1.png",
    description:
        "A modern apartment with stunning views of Table Mountain, open-plan kitchen, and secure parking.",
    price: 2500000,
    bedrooms: 3,
    bathrooms: 2,
    size: 120,
  ),
  Property(
    title: "Luxury Villa",
    location: "Johannesburg, South Africa",
    imagePath: "assets/House3.jpeg",
    description:
        "Escape to paradise in this stunning luxury villa, boasting breathtaking views, impeccable design, and unparalleled amenities. With lavish interiors, expansive living areas, and gourmet kitchens, this villa offers the ultimate retreat for discerning travelers.",
    price: 5500000,
    bedrooms: 6,
    bathrooms: 3,
    size: 600,
  ),
  Property(
    title: "Townhouse",
    location: "Durban, South Africa",
    imagePath: "assets/house2.png",
    description:
        "Cozy and stylish, this townhouse offers a perfect blend of urban living and comfort. With sleek interiors, ample natural light, and convenient amenities, it's an ideal haven for city dwellers.",
    price: 1800000,
    bedrooms: 3,
    bathrooms: 2,
    size: 100,
  ),
];
// QUESTION 2:Property Details Screen

class PropertyListScreen extends StatelessWidget {
  const PropertyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Blue Header
      appBar: AppBar(
        title: const Text("Available Properties"),
        backgroundColor: Colors.lightBlue,
      ),

      // List of Properties
      body: ListView.builder(
        itemCount: properties.length,
        itemBuilder: (context, index) {
          final property = properties[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            elevation: 2,
            child: ListTile(
              leading: const Icon(
                Icons.house_sharp,
                size: 40,
                color: Colors.green,
              ),
              title: Text(
                property.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(property.location),
              trailing: Text(
                "R ${property.price}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PropertyDetailScreen(property: property),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

//Question2

class PropertyDetailScreen extends StatelessWidget {
  final Property property;

  PropertyDetailScreen({required this.property});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(property.title), backgroundColor: Colors.blue),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(property.imagePath, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    property.title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    property.location,
                    style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Price: R${property.price}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.king_bed,
                            size: 28,
                            color: Colors.blueGrey,
                          ),
                          Text("${property.bedrooms} Bedrooms"),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.bathtub, size: 28, color: Colors.blueGrey),
                          Text("${property.bathrooms} Bathrooms"),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.square_foot,
                            size: 28,
                            color: Colors.blueGrey,
                          ),
                          Text("${property.size} m²"),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Description",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(property.description, style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
