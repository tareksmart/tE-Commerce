import 'package:ecommerce/models/addToCartModel.dart';
import 'package:ecommerce/services/database_controller.dart';
import 'package:ecommerce/views/widgets/card_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final database=Provider.of<Database>(context);
    return SafeArea(
      child: StreamBuilder<List<AddToCartModel>>(
        stream: database.myProductsCart(),
        builder: (context,snapShot){
          if(snapShot.connectionState==ConnectionState.active){
            final cartItems=snapShot.data;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox.shrink(),
                        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'My Cart',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                   const SizedBox(height: 16,),
                    if(cartItems==null&&cartItems!.isEmpty)
                      const Center(child: Text('no items available'),) ,
                    const SizedBox(height: 8,),
                    ListView.builder(
                      shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: cartItems!.length,
                        itemBuilder: (context, int index) {
                          return CartListItem(cartItem: cartItems[index]);
                        })
                  ],
                ),
              ),
            );
          }
          else {
            return  const Center(child: CircularProgressIndicator(),);
          }

        },

      ),
    );
  }
}
