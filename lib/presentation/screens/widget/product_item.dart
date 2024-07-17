
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import '../../../shared/style/colors.dart';
class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.desPrice,
    required this.rate,
  });

  final String image;
  final String name;
  final String description;
  final String price;
  final String desPrice;
  final String rate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      height: 300,
      decoration: BoxDecoration(
        border: Border.all(
          color: colors.BlueGrey,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [

            // Image And Heart Icon
            Stack(
              children: [
                // Image And Error Image
                Center(
                //  padding:  const EdgeInsets.all(1.0),
                  child: image.isNotEmpty ? Image.network(
                    image,
                    fit: BoxFit.cover,
                    height: 120,
                    width:120,
                  ) :
                  const Icon(
                    Icons.error,
                    size: 25,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: colors.white,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: const Padding (
                        padding: EdgeInsets.all(3.0),
                        child: Icon(
                          IconlyLight.heart,
                          color: colors.primary,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name Product
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(
                        color: colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  // Desc Product
                  Text(
                    description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(
                        color: colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Price
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text(
                          'EGP: $price',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                              color: colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          '$desPrice EGP',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                            color: colors.BlueGrey,
                            fontSize: 12,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: colors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 5,
                  ),

                  // Rating
                  Row(
                    children: [
                      Text(
                        'Review ($rate)',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                            color: colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Icon(
                        IconlyBold.star,
                        size: 17,
                        color: colors.yellow,
                      ),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          color: colors.primary,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 2,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: const Padding (
                          padding: EdgeInsets.all(3.0),
                          child: Icon(
                            Icons.add,
                            color: colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
