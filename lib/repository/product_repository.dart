import 'package:dartz/dartz.dart';
import '../../../../dependency_injection.dart';
import '../models/product_model.dart';
import '../shared/error/exceptions.dart';
import '../shared/remote/api_manager/api_consumer.dart';
import '../shared/remote/api_manager/end_points.dart';

class ProductRepository {

  //get products
  Future<Either<String, ProductsModel>> getProducts() async {
    try {
      final response = await lc<ApiConsumer>().get(
        EndPoint.products,
      );
      return Right(ProductsModel.fromJson(response));
    } on ServerException catch (error) {
      return left(error.errorModel.errorMessage);
    }
  }

}
