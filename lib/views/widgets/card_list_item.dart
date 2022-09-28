import 'package:ecommerce/controllers/quantity_controller.dart';
import 'package:ecommerce/models/addToCartModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartListItem extends StatefulWidget {
  final AddToCartModel cartItem;
  const CartListItem({Key? key, required this.cartItem}) : super(key: key);

  @override
  State<CartListItem> createState() => _CartListItemState();
}

class _CartListItemState extends State<CartListItem> {
  @override
  Widget build(BuildContext context) {
    int quantity = widget.cartItem.quantity;

    Future<void> _plusQuantity(int q) async {

    }
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
                    Consumer<QuantityController>(
                      builder:(context,quan,child){
                        return Row(
                          children: [
                            CircleAvatar(
                                backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                                child: IconButton(
                                    onPressed: () {
                                      quantity=quan.minusQuan(quantity, widget.cartItem.quantity);
                                    },
                                    icon: const Icon(Icons.minimize_outlined))),
                            const SizedBox(
                              width: 16,
                            ),
                            Text('$quantity'),
                            const SizedBox(
                              width: 16,
                            ),
                            CircleAvatar(
                                backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.add)),
                                )),
                          ],
                        );
                      }

                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${widget.cartItem.price}\$',
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
