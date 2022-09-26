import 'package:ecommerce/models/addToCartModel.dart';
import 'package:flutter/material.dart';

class CartListItem extends StatelessWidget {
  final AddToCartModel cartItem;
  const CartListItem({Key? key, required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.network(
            cartItem.imgUrl,
            fit: BoxFit.fill,
            width: 125,
            height: 125,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    cartItem.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(width: 20,),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_vert),
                  ),
                ],
              ),
              Row(
                children: [
                  Text('Color:${cartItem.color}'),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Size:${cartItem.size}')
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox.shrink(),
                  Text('Price:${cartItem.price}')],
              )
            ],
          ),
        ],
      ),
    );
  }
}
