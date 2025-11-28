import 'package:flutter/material.dart';
import 'package:union_shop/models/navigation.dart';
import 'package:union_shop/repositories/cart_data.dart';
import 'package:union_shop/models/products.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _quantity = 1;

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void navtocart(BuildContext context) {
    // Add the selected quantity to the cart
    for (int i = 0; i < _quantity; i++) {
      cd.instcartprod(pd.prodname, pd.prodcost, pd.prodpath);
    }
    // Update product counters and UI
    setState(() {
      pd.numofprod = cd.totalnumprod(pd.prodname);
      pd.carttxt = pd.carttxtbuild();
    });
    Navigator.pushNamed(context, '/cart');
  }

  @override
  Widget build(BuildContext context) {
    pd.numofprod = cd.totalnumprod(pd.prodname);
    pd.carttxt = pd.carttxtbuild();
    return LayoutBuilder(builder: (context, constraints) {
      final isMobile = constraints.maxWidth < 600;
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Header
              Container(
                height: isMobile ? 80 : 100,
                color: Colors.white,
                child: const Column(
                  children: [
                    // Top banner
                    Navbar(),
                    // Main header
                  ],
                ),
              ),

              // Product details
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(isMobile ? 12 : 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product image
                    Container(
                      height: isMobile ? 200 : 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[200],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          pd.prodpath,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[300],
                              child: const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.image_not_supported,
                                      size: 64,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Image unavailable',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    SizedBox(height: isMobile ? 12 : 24),

                    // Product name
                    Text(
                      pd.prodname,
                      style: TextStyle(
                        fontSize: isMobile ? 20 : 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    SizedBox(height: isMobile ? 8 : 12),

                    // Product price
                    Text(
                      pd.prodcost,
                      style: TextStyle(
                        fontSize: isMobile ? 18 : 24,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF4d2963),
                      ),
                    ),

                    SizedBox(height: isMobile ? 12 : 24),

                    // Product description
                    Text(
                      'Description',
                      style: TextStyle(
                        fontSize: isMobile ? 16 : 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: isMobile ? 6 : 8),
                    Text(
                      pd.proddesc,
                      style: TextStyle(
                        fontSize: isMobile ? 14 : 16,
                        color: Colors.grey,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),

              Center(
                child: isMobile
                    ? Column(
                        children: [
                          pd.carttxt,
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  if (_quantity > 1)
                                    setState(() => _quantity--);
                                },
                                icon: const Icon(Icons.remove),
                              ),
                              Text('$_quantity',
                                  style: const TextStyle(fontSize: 18)),
                              IconButton(
                                onPressed: () => setState(() => _quantity++),
                                icon: const Icon(Icons.add),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                  onPressed: () => navtocart(context),
                                  child: const Text('add to cart'))
                            ],
                          )
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          pd.carttxt,
                          const SizedBox(width: 12),
                          IconButton(
                            onPressed: () {
                              if (_quantity > 1) setState(() => _quantity--);
                            },
                            icon: const Icon(Icons.remove),
                          ),
                          Text('$_quantity',
                              style: const TextStyle(fontSize: 18)),
                          IconButton(
                            onPressed: () => setState(() => _quantity++),
                            icon: const Icon(Icons.add),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                              onPressed: () => navtocart(context),
                              child: const Text('add to cart'))
                        ],
                      ),
              ),

              // Footer
              const Footer()
            ],
          ),
        ),
      );
    });
  }
}
