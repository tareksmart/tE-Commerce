import 'package:ecommerce/utilities/app_assets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
      ],
    );
  }
}
