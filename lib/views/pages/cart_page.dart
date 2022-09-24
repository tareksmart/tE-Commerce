import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
          child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              const SizedBox.shrink(),
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              const SizedBox(
                height: 16,
              ),
              Text(
                'My Cart',
                style: Theme.of(context).textTheme.headline5,
              )
            ],
          )
      ],
          ),
        ),
      ),
    );
  }
}
