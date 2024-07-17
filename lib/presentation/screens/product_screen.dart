import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widget/product_item.dart';
import 'widget/search_item.dart';
import '../cubits/product_cubit.dart';
import '../cubits/product_state.dart';

class  ProductScreen  extends  StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: BlocConsumer<ProductCubit, ProductState>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = BlocProvider.of<ProductCubit>(context);
            return state is ProductLoadingState
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(
                        height: 25,
                      ),

                      // Search Product And Add Product To Cart
                      SearchAndCartItem(
                        cubit: cubit,
                      ),



                      // Products View
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing:15,
                                  mainAxisSpacing: 15,
                                  childAspectRatio: 0.75
                              ),
                          itemCount: cubit.search!.length,
                          itemBuilder: (context, index) {
                            return ProductItem(
                              image:
                                  cubit.search![index].images.first.toString(),
                              name: cubit.search![index].title,
                              description: cubit.search![index].description,
                              price: cubit.search![index].discountPercentage
                                  .toString(),
                              desPrice: cubit.search![index].price.toString(),
                              rate: cubit.search![index].rating.toString(),
                            );
                          },
                        ),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
