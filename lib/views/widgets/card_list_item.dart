import 'package:ecommerce/controllers/quantity_controller.dart';
import 'package:ecommerce/models/addToCartModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/database_controller.dart';
import 'main_dialog.dart';

class CartListItem extends StatefulWidget {
  final AddToCartModel cartItem;
  const CartListItem({Key? key, required this.cartItem}) : super(key: key);

  @override
  State<CartListItem> createState() => _CartListItemState();
}

class _CartListItemState extends State<CartListItem> {
  TextEditingController _controller = TextEditingController();
  Future<void> _addQuanToCart(int q) async {
    final database = Provider.of<Database>(context, listen: false);
    try {
      final addToCartProduct = AddToCartModel(
          productId: widget.cartItem.productId, //كود المنتج نفسه
          id: widget.cartItem.id, //كود فريد للdocument
          title: widget.cartItem.title,
          price: widget.cartItem.price,
          imgUrl: widget.cartItem.imgUrl,
          discountValue: widget.cartItem.discountValue,
          size: widget.cartItem.size,
          quantity: q);
      await database.addToCart(addToCartProduct);
    } catch (e) {
      MainDialog(
          context: context,
          content: e.toString(),
          title: 'Error',
          actions: [
            {'ok': () => Navigator.of(context).pop()}
          ]).showAlertDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    int quantity = widget.cartItem.quantity;

    Future<void> _plusQuantity(int q) async {}
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            child: Image.network(
              widget.cartItem.imgUrl,
              fit: BoxFit.fill,
              width: 125,
              height: 125,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.cartItem.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: 'Color:',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(color: Colors.grey)),
                          TextSpan(
                              text: widget.cartItem.color,
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(color: Colors.black))
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: 'Size:',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(color: Colors.grey)),
                          TextSpan(text: widget.cartItem.size)
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            child: IconButton(
                                onPressed: () {
                                  if (quantity > 0)
                                    _addQuanToCart(quantity - 1);
                                },
                                icon: const Icon(Icons.minimize_outlined))),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(key: ValueKey('quan'), quantity.toString()),
                        const SizedBox(
                          width: 16,
                        ),
                        CircleAvatar(
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: IconButton(
                                  onPressed: () {
                                    _addQuanToCart(quantity + 1);

                                  },
                                  icon: const Icon(Icons.add)),
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${widget.cartItem.price*quantity}\$',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
