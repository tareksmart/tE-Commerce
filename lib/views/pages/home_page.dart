import 'package:ecommerce/utilities/app_assets.dart';
import 'package:ecommerce/views/widgets/list_item_home.dart';
import 'package:flutter/material.dart';

import '../../models/product.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  Widget _buildHeaderOfList(
      {required String title,
      required String discreption,
      VoidCallback? tab,
      required BuildContext context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            InkWell(
              onTap: tab,
              child: Text(
                'View All',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ],
        ),
        Text(
          discreption,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Colors.grey),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Image.network(
              AppAssets.homePageBanner,
              width: double.infinity,
              height: size.height * 0.4,
              fit: BoxFit.cover,
            ),
            Opacity(
              opacity: 0.5,
              child: Container(
                color: Colors.black,
                width: double.infinity,
                height: size.height * 0.4,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Text(
                'Street Cloths',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            children: [
              _buildHeaderOfList(
                  title: 'Sale',
                  discreption: 'Super Summer Sale',
                  context: context),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 350,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    //dummyProducts جايه من ملف ال product هى من خارج الكلاس
                    children: dummyProducts
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListHomeItem(
                                product: e,
                              ),
                            ))
                        .toList()),
              )
            ],
          ),
        ),

      ],
    );
  }
}
