import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/utilities/app_assets.dart';
import 'package:ecommerce/utilities/routes.dart';
import 'package:flutter/material.dart';

class ListHomeItem extends StatelessWidget {
  final Product product;
  const ListHomeItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //rootNavigator: true عند الاتصال بابعد route اللى هو فى ال main ongenerate
      onTap: () => Navigator.of(context, rootNavigator: true)
          .pushNamed(AppRoutes.productDetails,arguments: product),
      child: SizedBox(
        height: 300,
        child: DecoratedBox(
          decoration: BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(product.imgUrl,
                        fit: BoxFit.fill, width: 130, height: 100),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: SizedBox(
                        width: 50,
                        height: 30,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.red),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                '${product.discountValue}%',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                '${product.category}',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.grey),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                '${product.title}',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                '${product.price}\$',
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: Colors.grey,
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
