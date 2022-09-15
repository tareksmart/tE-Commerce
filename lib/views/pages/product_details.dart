import 'package:ecommerce/views/widgets/drop_down_menu_item.dart';
import 'package:ecommerce/views/widgets/main_button.dart';
import 'package:flutter/material.dart';

import '../../models/product.dart';

class ProductDetails extends StatefulWidget {
  final Product product;
  bool _isFavorite = false;
  ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    late String dropDownValue;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.product.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              widget.product.imgUrl,
              width: double.infinity,
              height: size.height * 0.5,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 60,
                          child: DropDownMenuCompomnent(
                            hint: 'Size',
                              items: const ['S', 'M', 'XL', 'XXL'],
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropDownValue = newValue!;
                                });
                              }),
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          setState(() {
                            widget._isFavorite = !widget._isFavorite;
                          });
                        },
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: DecoratedBox(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Icon(
                              widget._isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: Colors.black54,
                            ),
                          ),
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
                      Text(
                        widget.product.title,
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      Text('\$${widget.product.price}',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontWeight: FontWeight.w600))
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '${widget.product.category}',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: Colors.grey.withOpacity(0.9)),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                      'this is dummy disc kkkkkkkkkk knkdkweqfke hidfqhweuifhuhqeu udhuewqh uhuqh ufqeuheuhueqhfu hu3fhue'),
                  const SizedBox(
                    height: 8,
                  ),
                  MainButton(
                      onTap: () {},
                      text: 'add to cart',
                      hasCircularBorder: true)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
