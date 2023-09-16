import 'package:flutter/material.dart';

void main() {
  runApp(ProductPage());
}

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Product> products = [
    Product("Product 1", 10.99, 5),
    Product("Product 2", 19.99, 10),
    Product("Product 3", 5.99, 3),
    Product("Product 3", 5.99, 3),
    Product("Product 3", 5.99, 3),
    Product("Product 3", 5.99, 3),
    Product("Product 3", 5.99, 3),
    Product("Product 3", 5.99, 3),
    Product("Product 3", 5.99, 3),
    // Add more products here
  ];

  int cartCount = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green, // Set the primary color to green
      ),

      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Fruits And Vegetables'),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(Icons.shopping_cart),
                  cartCount > 0
                      ? Positioned(
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      constraints: BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        cartCount.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  )
                      : SizedBox(),
                ],
              ),
            ),
          ],
        ),

        body:
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Adjust the number of columns as needed
          ),
          itemCount: products.length,

          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/product_image.png',width: 50,
                      height: 30, ),
                  Text(products[index].name),
                  Text('\$${products[index].price.toStringAsFixed(2)}'),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Quantity: ${products[index].quantity}'),
                      SizedBox(width: 10),
                      Row(
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                              minimumSize: MaterialStateProperty.all(Size(1, 1)),
                            ),
                            onPressed: () {
                              _incrementQuantity(index);
                            },
                            child: Icon(Icons.add),
                          ),
                          SizedBox(width: 10),
                          Text('${products[index].quantity}'),
                          SizedBox(width: 10),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                              minimumSize: MaterialStateProperty.all(Size(5, 5)), // Adjust the width and height as needed
                            ),
                            onPressed: () {
                              _decrementQuantity(index);
                            },
                            child: Icon(Icons.remove),
                          ),
                        ],
                      ),



                    ],
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                      minimumSize: MaterialStateProperty.all(Size(20, 30)),
                    ),

                    onPressed: () {
                      _addToCart(index);
                    },
                    child: Text('Add to Cart'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _incrementQuantity(int index) {
    setState(() {
      if (products[index].quantity < 99) {
        products[index].quantity++;
      }
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (products[index].quantity > 0) {
        products[index].quantity--;
      }
    });
  }

  void _addToCart(int index) {
    setState(() {
      if (products[index].quantity > 0) {
        cartCount++;
        products[index].quantity--;
      }
    });
  }
}

class Product {
  String name;
  double price;
  int quantity;

  Product(this.name, this.price, this.quantity);
}
