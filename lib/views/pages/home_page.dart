import 'package:ecommerce/services/auth.dart';
import 'package:ecommerce/services/database_controller.dart';
import 'package:ecommerce/utilities/app_assets.dart';
import 'package:ecommerce/views/widgets/list_item_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  Widget _buildHeaderOfList(
      //header
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
    final database = Provider.of<Database>(context);
    //final auth=Provider.of<Authbase>(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.asset('assets/images/pexels-photo-911677.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: size.height * 0.4),
              // Image.network(
              //   AppAssets.homePageBanner,
              //   width: double.infinity,
              //   height: size.height * 0.4,
              //   fit: BoxFit.cover,
              // ),
              Opacity(
                opacity: 0.5,
                child: Container(
                  color: Colors.black,
                  width: double.infinity,
                  height: size.height * 0.4,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Text(
                  'Street Cloths',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 5,
              )
              // ,TextButton(onPressed: ()async=>await auth.signOut(),
              //   child: Text('sign out'),),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeaderOfList(
                    title: 'Sale',
                    discreption: 'Super Summer Sale',
                    context: context),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: size.height * 0.5,
                  child: StreamBuilder<List<Product>>(
                    stream: database.salesProductStream(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.active) {
                        final products = snapshot.data;
                        if (products == null) {
                          return Center(child: Text('no data is available'));
                        }
                        return ListView(
                          scrollDirection: Axis.horizontal,
                          //dummyProducts جايه من ملف ال product هى من خارج الكلاس
                          children: products
                              .map((e) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListHomeItem(
                                      product: e,
                                      isNew: false,
                                    ),
                                  ))
                              .toList(),
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
                _buildHeaderOfList(
                    title: 'New',
                    discreption: 'You\'v never seen before',
                    context: context),
               const SizedBox(
                  height: 2,
                ),
                SizedBox(
                  height: size.height * 0.5,
                  child: StreamBuilder<List<Product>>(
                    stream: database.newProductStream(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.active) {
                        final products = snapshot.data;
                        if (products == null) {
                          return const Center(
                            child: Text('no available product'),
                          );
                        }

                        return ListView(
                            scrollDirection: Axis.horizontal,
                            //dummyProducts جايه من ملف ال product هى من خارج الكلاس
                            children: products
                                .map((e) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ListHomeItem(
                                        product: e,
                                        isNew: true,
                                      ),
                                    ))
                                .toList());
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
