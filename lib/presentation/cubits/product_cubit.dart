import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:route_project/presentation/cubits/product_state.dart';

import '../../models/product_model.dart';
import '../../repository/product_repository.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productRepository) : super(ProductInitial());
  final ProductRepository productRepository;


  List<ProductModel> products =[] ;
  List<ProductModel>? search ;

  void getProduct() async {
    emit(ProductLoadingState());

    final res = await productRepository.getProducts();
    res.fold(
          (e) => emit(ProductErrorState()),
          (s) {
            products = s!.products ;
            search = products;
        emit(ProductSuccessState());
      },
    );
  }

  void searchProduct(String? searchTerm) {
    if (products.isNotEmpty) {
      if (searchTerm!.isEmpty) {
        search = products;
      } else {
        search = products
            .where((title) =>
            title.title.toLowerCase().contains(searchTerm.toLowerCase()))
            .toList();
      }
      emit(SearchResultState());
    }
  }



}

