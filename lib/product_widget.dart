import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final String name;
  final int price;
  final String image;

  const ProductWidget({
    Key? key,
    required this.name,
    required this.price,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(image),
          Text(name),
          Text('\$$price'),
          TextButton(
            onPressed: () {},
            child: Text('Add to cart'),
          ),
        ],
      ),
    );
  }
}