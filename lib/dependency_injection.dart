import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:route_project/presentation/cubits/product_cubit.dart';
import 'package:route_project/repository/product_repository.dart';
import 'package:route_project/shared/remote/api_manager/api_consumer.dart';
import 'package:route_project/shared/remote/api_manager/dio_consumer.dart';

import 'cache/cache_helper.dart';
final lc = GetIt.instance;


Future<void> setUpLocator()async{
  //cubits

  lc.registerLazySingleton(()=>ProductCubit(lc()));

  //product feature
  lc.registerLazySingleton(() => ProductRepository());
  //external
  lc.registerSingleton(()=>CacheHelper());

  lc.registerLazySingleton<ApiConsumer>(()=>DioConsumer(lc()));
  lc.registerLazySingleton(()=>Dio());


}