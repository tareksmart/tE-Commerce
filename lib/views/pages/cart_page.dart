import 'package:ecommerce/controllers/quantity_controller.dart';
import 'package:ecommerce/models/addToCartModel.dart';
import 'package:ecommerce/services/database_controller.dart';
import 'package:ecommerce/utilities/routes.dart';
import 'package:ecommerce/views/widgets/card_list_item.dart';
import 'package:ecommerce/views/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int total=0;
  @override
  void didChangeDependencies() async {
    final myProducts=await Provider.of<Database>(context).myProductsCart().first;
    setState(() {
      myProducts.forEach((element) {total+=element.price;});
    });
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
    return SafeArea(
      child: StreamBuilder<List<AddToCartModel>>(
        stream: database.myProductsCart(),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.active) {
            final cartItems = snapShot.data;
            return SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox.shrink(),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.search)),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'My Cart',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    if (cartItems == null && cartItems!.isEmpty)
                      const Center(
                        child: Text('no items available'),
                      ),
                    const SizedBox(
                      height: 8,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: cartItems!.length,
                        itemBuilder: (context, int index) {
                          return ChangeNotifierProvider<QuantityController>(
                            create:(context)=>QuantityController(newQuantity: 1,oldQuantity: 1),
                          child: CartListItem(cartItem: cartItems[index]),) ;
                        }),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Amount:',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: Colors.grey),
                          ),
                          Text(
                            '$total\$',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    MainButton(
                        onTap: () {
                          Navigator.of(context,rootNavigator: true).pushNamed(AppRoutes.checkOut,
                          );
                        },
                        text: 'CHECK OUT',
                        hasCircularBorder: true),
                    const SizedBox(
                      height: 32,
                    )
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
