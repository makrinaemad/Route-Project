import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_project/presentation/cubits/product_cubit.dart';


import 'app.dart';
import 'dependency_injection.dart';


void main()async {
  //WidgetsFlutterBinding.ensureInitialized();
   await setUpLocator();
  runApp(
      BlocProvider(
          create: (context) => lc<ProductCubit>()..getProduct(),
        child:  const RouteProject (),
      )

  );
}


