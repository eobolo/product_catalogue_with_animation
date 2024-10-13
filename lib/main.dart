import 'package:flutter/material.dart';
import 'package:get/get.dart'; // For using GetMaterialApp and state management
import 'package:product_catalogue/products/product.dart';
import 'package:product_catalogue/themes/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Store',
      theme: AppThemes.lightTheme, // Set the default theme
      darkTheme: AppThemes.darkTheme, // Set the dark theme
      themeMode: ThemeMode.light, // Set the initial theme mode
      home: const CatalogPage(),
    );
  }
}

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  // Sample product list
  final List<Product> products = [
    Product(
        name: 'Product 1',
        imageUrl:
            'https://cdn.pixabay.com/photo/2019/09/03/10/53/watch-4449152_640.jpg',
        price: 29.99),
    Product(
        name: 'Product 2',
        imageUrl:
            'https://cdn.pixabay.com/photo/2023/08/11/10/15/watch-8183268_640.jpg',
        price: 49.99),
    Product(
        name: 'Product 3',
        imageUrl:
            'https://cdn.pixabay.com/photo/2021/08/03/06/47/clock-6518632_640.jpg',
        price: 19.99),
  ];

  bool isDarkTheme = false; // Track the theme mode

  // Function to toggle between light and dark themes
  void toggleTheme() {
    setState(() {
      isDarkTheme = !isDarkTheme;
      Get.changeThemeMode(isDarkTheme ? ThemeMode.dark : ThemeMode.light);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Store'),
        actions: [
          IconButton(
            icon: Icon(isDarkTheme ? Icons.dark_mode : Icons.light_mode),
            onPressed:
                toggleTheme, // Call toggleTheme when the button is pressed
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Display 2 products per row
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
              onTap: () {
                // Show a dialog with the product name when tapped
                Get.defaultDialog(
                  title: product.name,
                  content: Text('Price: \$${product.price}'),
                );
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Image of the product
                    Expanded(
                      child: Image.network(
                        product.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Product name and price
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        product.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text('\$${product.price}'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
