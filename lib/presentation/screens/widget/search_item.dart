import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import '../../../shared/style/colors.dart';
import '../../cubits/product_cubit.dart';

class SearchAndCartItem extends StatelessWidget {
  const SearchAndCartItem({
    super.key,
    required this.cubit,
  });

  final ProductCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 9,
          child: SizedBox(
            height: 50,
            child:
            TextFormField(
              onChanged:(val){
          cubit.searchProduct(val);
        },
              decoration: InputDecoration(
                hintText:"what do you search for?",
                prefixIcon: Icon(
                    IconlyLight.search,
                    size: 25,
                    color: colors.primary,
                  ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(
                    color:  colors.primary,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(50),
                  borderSide: BorderSide(
                    color:  colors.primary,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(
                    color:  colors.primary,
                  ),
                ),
              ),
          ),
        ),),
        Flexible(
          flex: 1,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              IconlyLight.buy,
              size: 35,
              color: colors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
