import 'package:ecommerce/views/widgets/drop_down_menu_item.dart';
import 'package:ecommerce/views/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/addToCartModel.dart';
import '../../models/product.dart';
import '../../services/database_controller.dart';
import '../../utilities/constants.dart';
import '../widgets/main_dialog.dart';

class ProductDetails extends StatefulWidget {
  final Product product;

  ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool _isFavorite = false;
  late String dropDownValue;
  Future<void> _addToCart() async {
    final database = Provider.of<Database>(context,listen: false);
    try {
      final addToCartProduct = AddToCartModel(
          productId: widget.product.id,//كود المنتج نفسه
          id: documentIdFromLocalData(),//كود فريد للdocument
          title: widget.product.title,
          price: widget.product.price,
          imgUrl: widget.product.imgUrl,
          discountValue: widget.product.discountValue,
          size: dropDownValue);
      await database.addToCart(addToCartProduct);
    } catch (e) {
      MainDialog(context: context, content: e.toString(), title: 'Error',actions: [{'ok':()=>Navigator.of(context).pop()}])
          .showAlertDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
                            _isFavorite = !_isFavorite;
                          });
                        },
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: DecoratedBox(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Icon(
                              _isFavorite
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
                      onTap: _addToCart,
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
