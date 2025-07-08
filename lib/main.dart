import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bike Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BikeShopHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BikeShopHome extends StatefulWidget {
  @override
  _BikeShopHomeState createState() => _BikeShopHomeState();
}

class _BikeShopHomeState extends State<BikeShopHome> {
  int cartCount = 0;
  int quantity = 0;

  void _updateQuantity(int change) {
    setState(() {
      int newQuantity = (quantity + change).clamp(0, 99);
      int difference = newQuantity - quantity;
      
      quantity = newQuantity;
      cartCount = (cartCount + difference).clamp(0, 99);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6FA),
      body: SafeArea(
        child: Column(
          children: [

            
            // Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Profile with green online indicator badge
                  Badge(
                    backgroundColor: Color(0xFF10B981),
                    smallSize: 14,
                    offset: Offset(-2, -2),
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF6B46C1), Color(0xFF3B82F6)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                  
                  // Home Title
                  Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  
                  // Notification with badge
                  Badge(
                    backgroundColor: Color(0xFF06B6D4),
                    child: Icon(
                      Icons.notifications_outlined,
                      color: Color(0xFF06B6D4),
                      size: 28,
                    ),
                  ),
                ],
              ),
            ),
            
            // Product Card
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: Column(
                          children: [
                            // Bike Image Area
                            Container(
                              height: 120,
                              child: Center(
                                child: Image.asset(
                                  'assets/bicycle.png',
                                  width: 200,
                                  height: 120,
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) {
                                    // Fallback when image is not found
                                    return Container(
                                      width: 200,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF06B6D4),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Icon(
                                        Icons.directions_bike,
                                        size: 60,
                                        color: Colors.white,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            
                            SizedBox(height: 30),
                            
                            // Product Info
                            Text(
                              'CycloTech X-200',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            
                            SizedBox(height: 8),
                            
                            Text(
                              '\$ 849.99',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF6B7280),
                              ),
                            ),
                            
                            SizedBox(height: 30),
                            
                            // Quantity Controls
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () => _updateQuantity(-1),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF3F4F6),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Icon(
                                      Icons.remove,
                                      color: quantity > 0 ? Colors.black : Color(0xFF9CA3AF),
                                      size: 20,
                                    ),
                                  ),
                                ),
                                
                                SizedBox(width: 40),
                                
                                Container(
                                  width: 40,
                                  child: Text(
                                    '$quantity',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                
                                SizedBox(width: 40),
                                
                                GestureDetector(
                                  onTap: () => _updateQuantity(1),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF3F4F6),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Bottom Navigation
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Color(0xFFE5E7EB), width: 0.5),
                ),
              ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Home Tab
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.home,
                            color: Color(0xFF06B6D4),
                            size: 24,
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Home',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF06B6D4),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      
                      // Cart Tab
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Badge(
                            label: cartCount > 0 ? Text('$cartCount') : null,
                            smallSize: 14,
                            padding: EdgeInsets.all(2),
                            offset: Offset(12, -4),
                            textStyle: TextStyle(fontSize: 12),
                            backgroundColor: Color(0xFF06B6D4),
                            largeSize: 24,
                            child: Icon(
                              Icons.shopping_cart_outlined,
                              color: Color(0xFF9CA3AF),
                              size: 24,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Cart',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF9CA3AF),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}