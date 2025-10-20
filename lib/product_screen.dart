import 'package:ecommerece_app/myorders.dart';
import 'package:ecommerece_app/mycart.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'cart_service.dart'; // Update with your actual package name

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List products = [];
  List allProducts = [];
  List categories = [];
  String selectedCategory = 'all';
  bool isLoading = true;
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    fetchCategories();
    fetchProducts();
  }

  Future<void> fetchCategories() async {
    final response = await http
        .get(Uri.parse('https://fakestoreapi.com/products/categories'));
    if (response.statusCode == 200) {
      setState(() {
        categories = ['all', ...json.decode(response.body)];
      });
    }
  }

  Future<void> fetchProducts([String? category]) async {
    setState(() {
      isLoading = true;
    });
    String url = 'https://fakestoreapi.com/products';
    if (category != null && category != 'all') {
      url = 'https://fakestoreapi.com/products/category/$category';
    }
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        allProducts = json.decode(response.body);
        products = allProducts;
        isLoading = false;
      });
      filterProducts();
    }
  }

  void filterProducts() {
    setState(() {
      if (searchQuery.isEmpty) {
        products = allProducts;
      } else {
        products = allProducts.where((product) {
          final title = product['title'].toString().toLowerCase();
          return title.contains(searchQuery.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 241, 237),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 98, 158, 130),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage(
                        'assets/profile.jpg'), // Replace with your asset
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Welcome, Shopper!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'shopper@email.com',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart,
                  color: Color.fromARGB(255, 98, 158, 130)),
              title: const Text('My Orders'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyOrders()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite,
                  color: Color.fromARGB(255, 98, 158, 130)),
              title: const Text('My Cart'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyCart()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.person,
                  color: Color.fromARGB(255, 98, 158, 130)),
              title: const Text('Profile'),
              onTap: () {
                // Navigate to Profile
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings,
                  color: Color.fromARGB(255, 98, 158, 130)),
              title: const Text('Settings'),
              onTap: () {
                // Navigate to Settings
              },
            ),
            ListTile(
              leading: const Icon(Icons.info,
                  color: Color.fromARGB(255, 98, 158, 130)),
              title: const Text('About'),
              onTap: () {
                // Navigate to About
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout,
                  color: Color.fromARGB(255, 98, 158, 130)),
              title: const Text('Logout'),
              onTap: () {
                // Logout logic
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 98, 158, 130),
        title: const Text('Dashboard',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with avatar and greeting
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 18),
                        Text(
                          "Welcome Back,",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "Shopper!",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 98, 158, 130),
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage(
                          'assets/profile.jpg'), // Replace with your asset
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                // Promotional Banner
                Container(
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 98, 158, 130),
                        Color.fromARGB(255, 233, 241, 237),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        right: 10,
                        bottom: 10,
                        child: Icon(Icons.shopping_bag,
                            size: 60, color: Colors.white.withOpacity(0.2)),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Big Sale!",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              "Up to 50% off on selected items.",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                // Search Bar
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search products...',
                    prefixIcon: const Icon(Icons.search,
                        color: Color.fromARGB(255, 98, 158, 130)),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    searchQuery = value;
                    filterProducts();
                  },
                ),
                const SizedBox(height: 18),
                // Categories
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final cat = categories[index];
                      final isSelected = cat == selectedCategory;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: ChoiceChip(
                          label: Text(
                            cat.toString().toUpperCase(),
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          selected: isSelected,
                          selectedColor:
                              const Color.fromARGB(255, 98, 158, 130),
                          backgroundColor: Colors.grey[200],
                          onSelected: (selected) {
                            setState(() {
                              selectedCategory = cat;
                              searchQuery = '';
                            });
                            fetchProducts(cat == 'all' ? null : cat);
                          },
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 18),
                // Featured Products Section
                const Text(
                  "Featured Products",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 98, 158, 130),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 220,
                  child: isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : products.isEmpty
                          ? const Center(
                              child: Text(
                                'No products found',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          : ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  products.length > 5 ? 5 : products.length,
                              separatorBuilder: (context, _) =>
                                  const SizedBox(width: 12),
                              itemBuilder: (context, index) {
                                final product = products[index];
                                return Container(
                                  width: 160,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        blurRadius: 6,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius:
                                              const BorderRadius.vertical(
                                                  top: Radius.circular(16)),
                                          child: Image.network(
                                            product['image'],
                                            fit: BoxFit.contain,
                                            width: double.infinity,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          product['title'],
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          "\$${product['price']}",
                                          style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 98, 158, 130),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 98, 158, 130),
                                            minimumSize:
                                                const Size.fromHeight(32),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          onPressed: () {
                                            CartService().addToCart(product);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                    'Successfully added to cart!'),
                                                backgroundColor: Color.fromARGB(
                                                    255, 98, 158, 130),
                                                duration: Duration(seconds: 2),
                                              ),
                                            );
                                          },
                                          child: const Text(
                                            'Add to Cart',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                ),
                const SizedBox(height: 18),
                // All Products Section
                const Text(
                  "All Products",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 98, 158, 130),
                  ),
                ),
                const SizedBox(height: 12),
                isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : products.isEmpty
                        ? const Center(
                            child: Text(
                              'No products found',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: screenWidth > 600 ? 4 : 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: 0.65,
                            ),
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              final product = products[index];
                              return Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius:
                                            const BorderRadius.vertical(
                                                top: Radius.circular(16)),
                                        child: Image.network(
                                          product['image'],
                                          fit: BoxFit.contain,
                                          width: double.infinity,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        product['title'],
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Text(
                                        "\$${product['price']}",
                                        style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 98, 158, 130),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(
                                              255, 98, 158, 130),
                                          minimumSize:
                                              const Size.fromHeight(36),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        onPressed: () {
                                          CartService().addToCart(product);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  'Successfully added to cart!'),
                                              backgroundColor: Color.fromARGB(
                                                  255, 98, 158, 130),
                                              duration: Duration(seconds: 2),
                                            ),
                                          );
                                        },
                                        child: const Text(
                                          'Add to Cart',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
